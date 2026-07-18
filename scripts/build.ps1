[CmdletBinding()]
param(
    [ValidateSet("electronic", "print")]
    [string]$Mode = "electronic",

    [ValidateSet("general", "ee")]
    [string]$Profile = "general",

    [string]$StudentId
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$entry = switch ("$Profile-$Mode") {
    "general-electronic" { "main.tex" }
    "general-print" { "main-print.tex" }
    "ee-electronic" { "main-ee.tex" }
    "ee-print" { "main-ee-print.tex" }
}
$job = "nchu-thesis-$Profile-$Mode"
$buildDir = Join-Path $root "tmp\build\$Profile-$Mode"
$outputDir = Join-Path $root "output\pdf"

New-Item -ItemType Directory -Force -Path $buildDir, $outputDir | Out-Null

function Invoke-Checked {
    param(
        [Parameter(Mandatory)]
        [string]$Command,
        [Parameter(Mandatory)]
        [string[]]$Arguments
    )

    & $Command @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "$Command failed with exit code $LASTEXITCODE."
    }
}

Push-Location $root
try {
    $xelatexArgs = @(
        "-interaction=nonstopmode",
        "-halt-on-error",
        "-output-directory=$buildDir",
        "-jobname=$job",
        $entry
    )

    Invoke-Checked "xelatex" $xelatexArgs
    Invoke-Checked "bibtex" @((Join-Path $buildDir $job))
    Invoke-Checked "xelatex" $xelatexArgs
    Invoke-Checked "xelatex" $xelatexArgs

    $builtPdf = Join-Path $buildDir "$job.pdf"
    $finalName = if ($Profile -eq "ee" -and $Mode -eq "electronic" -and $StudentId) {
        "$StudentId-碩士論文.pdf"
    }
    else {
        "$job.pdf"
    }
    $finalPdf = Join-Path $outputDir $finalName
    Copy-Item -LiteralPath $builtPdf -Destination $finalPdf -Force
    Write-Host "SUCCESS: $finalPdf"
}
finally {
    Pop-Location
}
