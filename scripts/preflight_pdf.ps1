[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$PdfPath,

    [ValidateSet("electronic", "print")]
    [string]$Mode = "electronic",

    [switch]$FinalSubmission
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$resolvedPdf = (Resolve-Path -LiteralPath $PdfPath).Path
$failures = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()

function Resolve-PopplerTool {
    param([Parameter(Mandatory)][string]$Name)

    $bundled = Join-Path $env:USERPROFILE ".cache\codex-runtimes\codex-primary-runtime\dependencies\native\poppler\Library\bin\$Name.exe"
    if (Test-Path -LiteralPath $bundled) {
        return $bundled
    }

    $command = Get-Command "$Name.exe" -ErrorAction SilentlyContinue
    if ($command) {
        return $command.Source
    }

    throw "Cannot find $Name. Install Poppler or add it to PATH."
}

$pdfinfo = Resolve-PopplerTool "pdfinfo"
$pdffonts = Resolve-PopplerTool "pdffonts"
$pdftotext = Resolve-PopplerTool "pdftotext"

$file = Get-Item -LiteralPath $resolvedPdf
$sizeMiB = [math]::Round($file.Length / 1MB, 2)
if ($file.Length -gt 20MB) {
    $failures.Add("PDF is $sizeMiB MiB; the library limit is 20 MiB.")
}

$info = & $pdfinfo -box $resolvedPdf 2>&1
if ($LASTEXITCODE -ne 0) {
    throw "pdfinfo failed for $resolvedPdf."
}

$encryptedLine = $info | Where-Object { $_ -match "^Encrypted:" } | Select-Object -First 1
if ($encryptedLine -notmatch "no") {
    $failures.Add("PDF is encrypted or has security restrictions.")
}

$pageSizeLines = $info | Where-Object { $_ -match "^(Page size|Page\s+\d+\s+size):" }
if (-not $pageSizeLines) {
    $warnings.Add("Could not read page dimensions.")
}
foreach ($line in $pageSizeLines) {
    if ($line -match "([0-9.]+)\s+x\s+([0-9.]+)\s+pts") {
        $width = [double]$Matches[1]
        $height = [double]$Matches[2]
        $isA4 = ([math]::Abs($width - 595.28) -lt 2 -and [math]::Abs($height - 841.89) -lt 2) -or
                ([math]::Abs($height - 595.28) -lt 2 -and [math]::Abs($width - 841.89) -lt 2)
        if (-not $isA4) {
            $failures.Add("Non-A4 page detected: $line")
        }
    }
}

$fontOutput = & $pdffonts $resolvedPdf 2>&1
if ($LASTEXITCODE -ne 0) {
    throw "pdffonts failed for $resolvedPdf."
}
$fontRows = $fontOutput | Select-Object -Skip 2
foreach ($row in $fontRows) {
    if ($row -match "\s+(yes|no)\s+(yes|no)\s+(yes|no)\s+\d+\s+\d+\s*$") {
        if ($Matches[1] -eq "no") {
            $failures.Add("A font is not embedded: $row")
        }
    }
}

$textFile = Join-Path ([System.IO.Path]::GetTempPath()) ("nchu-preflight-" + [guid]::NewGuid().ToString("N") + ".txt")
try {
    & $pdftotext $resolvedPdf $textFile
    if ($LASTEXITCODE -ne 0) {
        throw "pdftotext failed for $resolvedPdf."
    }
    $text = Get-Content -Raw -LiteralPath $textFile
    if (($text -replace "\s", "").Length -lt 100) {
        $failures.Add("PDF has too little searchable text; it may be image-only.")
    }
}
finally {
    if (Test-Path -LiteralPath $textFile) {
        Remove-Item -LiteralPath $textFile -Force
    }
}

if ($Mode -eq "electronic" -and $FinalSubmission) {
    $approval = Join-Path $root "a4_approval.pdf"
    if (-not (Test-Path -LiteralPath $approval)) {
        $failures.Add("Final electronic submission requires a4_approval.pdf.")
    }
}

Write-Host "PDF: $resolvedPdf"
Write-Host "Mode: $Mode"
Write-Host "Size: $sizeMiB MiB"
foreach ($warning in $warnings) {
    Write-Warning $warning
}

if ($failures.Count -gt 0) {
    foreach ($failure in $failures) {
        Write-Error $failure -ErrorAction Continue
    }
    exit 1
}

Write-Host "PASS: A4, size, security, searchable text, and embedded-font checks passed."
