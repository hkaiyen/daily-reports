# 川寶每日報告 - 部署說明

## 📋 概述

本專案用於自動發布川寶團隊的每日報告，透過 MkDocs 生成靜態網站，並部署到 Vercel 平台。

## 🏗️ 技術架構

- **靜態網站生成器：** MkDocs
- **主題：** Material for MkDocs（支援繁體中文）
- **託管平台：** Vercel
- **部署方式：** Vercel CLI

## 📁 目錄結構

```
reports_site/
├── mkdocs.yml              # MkDocs 設定檔
├── deploy_to_vercel.sh     # 自動部署腳本
├── README.md               # 本說明檔案
└── docs/
    ├── index.md            # 首頁
    └── reports/            # 報告存放目錄
        ├── index.md       # 報告列表
        └── *.md            # 各報告檔案
```

## 🚀 部署方式

### 方式一：自動化部署（推薦）

老闆只需提供 **Google 帳號** 給小安，小安會幫忙設定好所有東西。

之後每次發布報告，只需執行：

```bash
cd ~/.openclaw/workspace/reports_site
./deploy_to_vercel.sh
```

### 方式二：手動部署

#### 步驟 1：安裝必要工具

```bash
# 安裝 MkDocs
pip install mkdocs

# 安裝 MkDocs Material 主題
pip install mkdocs-material

# 安裝繁體中文支援
pip install mkdocs-material-snippets

# 安裝 Vercel CLI
npm install -g vercel
```

#### 步驟 2：登入 Vercel

```bash
vercel login
```

支援 Google、GitHub、Email 登入。

#### 步驟 3：首次部署

```bash
cd ~/.openclaw/workspace/reports_site
mkdocs build
cd site
vercel --prod
```

#### 步驟 4：日後更新

每次新增報告後，執行：

```bash
cd ~/.openclaw/workspace/reports_site
./deploy_to_vercel.sh
```

## 📝 新增報告的方式

1. 在 `docs/reports/` 目錄下建立新的 `.md` 檔案
2. 檔案命名建議：`2026-04-30-report.md`
3. 內容格式請參考 `docs/reports/example-report.md`
4. 執行部署腳本即可發布

## ⚙️ Vercel 設定（供小安參考）

### 必要設定

1. **登入方式：** Google 帳號登入
2. **專案名稱：** chuanbao-reports
3. **建構指令：** `mkdocs build`
4. **發布目錄：** `site/`
5. **環境變數：** 無需設定

### 網址

部署成功後，Vercel 會提供一個 `.vercel.app` 網址，
老闆可以自行設定custom domain（如有需要）。

## ❓ 常見問題

### Q: 忘記密碼怎麼辦？
A: 透過 Vercel 的「忘記密碼」功能重設。

### Q: 報告更新後網站沒變？
A: 請確認已執行 `mkdocs build` 並重新部署。

### Q: 可以綁定自己的網域嗎？
A: 可以，Vercel 支援免費自訂網域，請提供網域給小安設定。

## 📞 聯絡方式

如有問題，請聯繫川寶團隊。
