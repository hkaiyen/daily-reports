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

---

## 🔧 小安部署記錄（2026-04-30）

### ✅ 已完成
1. Git 全域帳號設定（user.name=hkaiyen, user.email=Hkaiyen@gmail.com）
2. 確認 reports_site 資料夾存在且包含：
   - mkdocs.yml（MkDocs 設定檔）
   - docs/（網站內容目錄）
   - deploy_to_vercel.sh（部署腳本）
3. Git 初始化完成
4. Remote origin 已設定（但尚未成功連線）

### ❌ 無法自動完成（需要老闆操作）
1. **建立 GitHub repository**
   - 需要 Personal Access Token（PAT）才能透過 API 建立
   - GitHub 已不支援密碼認證

2. **推送到 GitHub**
   - 需要有效的 PAT 作為密碼
   - 錯誤訊息：Password authentication is not supported for Git operations

3. **連結 GitHub 到 Vercel**
   - 需要先有 GitHub repository 才能設定

### 📝 老闆需要做的事

#### 第一步：生成 GitHub Personal Access Token
1. 前往 https://github.com/settings/tokens
2. 點擊「Generate new token (classic)」
3. 設定：
   - Note: `vercel-deploy`
   - 勾選 `repo` 權限（完整存取）
   - 勾選 `read:org` 權限
4. 點擊「Generate token」
5. **立即複製 Token**（關閉頁面後無法再查看）

#### 第二步：把 Token 提供給小安
直接回覆：「我的 GitHub PAT 是：ghp_xxxxxxxxxxxx」

#### 第三步：小安會自動完成
- 建立 GitHub repository
- 推送程式碼
- 連結到 Vercel
- 回報 Vercel 網址

