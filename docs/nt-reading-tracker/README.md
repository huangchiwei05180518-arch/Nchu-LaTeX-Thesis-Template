# 恢復本新約五遍進度追蹤（雲端同步版）

這個版本維持原本的網站介面，但資料可以同步到雲端，讓你在手機、平板、電腦看到同一份進度。

## 已放到這個 repo 的檔案
- `docs/nt-reading-tracker/index.html`：網站主檔
- `docs/nt-reading-tracker/supabase_schema.sql`：到 Supabase 建資料表用

## 使用方式
1. 準備一個 Supabase 專案
2. 到 SQL Editor 執行 `supabase_schema.sql`
3. 讓這個 `docs` 資料夾透過 GitHub Pages 發佈
4. 打開網站後，按「雲端同步設定」
5. 填入：
   - Supabase URL
   - anon public key
   - 同步識別碼（例如 `huang-nt-01`）
6. 按「用目前進度初始化雲端」

之後在其他裝置：
1. 打開同一個網站
2. 輸入同一組 URL、anon key、同步識別碼
3. 按「從雲端讀取」
