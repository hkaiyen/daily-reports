# 川寶每日報告網站 - 完整部署指南

## 📦 懶人包內容

此壓縮檔包含建立 MkDocs 靜態網站並部署到 Vercel 的完整程式碼。

---

## 🏠 本機資料夾結構

```
daily-reports-site/
├── mkdocs.yml           # MkDocs 設定檔（網站名稱、主題、語言）
├── vercel.json         # Vercel 部署設定
├── README.md           # 本說明文件
├── deploy_to_vercel.sh # 部署腳本（Mac/Linux）
├── complete_deploy.sh  # 完整部署腳本
└── docs/               # 網站內容 Markdown 檔案
    ├── index.md        # 首頁
    └── reports/        # 報告存放資料夾
        ├── index.md        # 報告列表頁
        └── example-report.md # 範例報告
```

---

## 🚀 快速開始（從零到上線）

### Step 1：準備環境

**需要安裝的軟體：**

| 軟體 | 版本 | 安裝方式 | 用途 |
|------|------|---------|------|
| Python | 3.8+ | python.org 或 `brew install python` | 執行 MkDocs |
| Git | 最新 | `brew install git` 或 git-scm.com | 程式碼版本控制 |
| MkDocs | 最新 | `pip install mkdocs-material` | 產生網站 |
| MkDocs Material | 最新 | `pip install mkdocs-material` | 漂亮的主題 |

**快速安裝所有需求：**
```bash
# 安裝 Python（如果還沒有的話）
# macOS:
brew install python git

# Windows: 從 python.org 下載安裝

# 安裝 MkDocs 和所需套件
pip install mkdocs mkdocs-material
```

---

### Step 2：建立 GitHub 帳號（如果還沒有）

1. 前往 https://github.com 註冊
2. 記住帳號密碼

---

### Step 3：在 GitHub 建立 Repository

1. 登入 GitHub
2. 點右上角「+」→「New repository」
3. 名稱填：`daily-reports`（其他保持預設）
4. 點「Create repository」

---

### Step 4：Clone 並設定專案

```bash
# 在終端機執行（把 YOUR_TOKEN 和 YOUR_USERNAME 換成你的）

# 建立資料夾
mkdir -p ~/daily-reports-site
cd ~/daily-reports-site

# 初始化 Git
git init

# 設定遙端（把 YOUR_TOKEN 換成你的 GitHub Personal Access Token）
git remote add origin https://YOUR_USERNAME:YOUR_TOKEN@github.com/YOUR_USERNAME/daily-reports.git

# 設定 Git 帳號（把 YOUR_EMAIL 和 YOUR_NAME 換成你的）
git config user.email "your@email.com"
git config user.name "Your Name"
```

---

### Step 5：複製本懶人包的檔案

把 `daily-reports-site` 資料夾內所有檔案複製到本機新資料夾

---

### Step 6：提交到 GitHub

```bash
cd ~/daily-reports-site

# 新增所有檔案
git add .

# 提交
git commit -m "Initial commit: 川寶每日報告網站"

# 推送到 GitHub
git push -u origin main
```

---

### Step 7：部署到 Vercel

1. 前往 https://vercel.com
2. 用 Google 或 GitHub 帳號登入
3. 點「Import Git Repository」
4. 選擇 `daily-reports` 倉庫
5. Framework Preset：選擇 `Other`
6. Output Directory：留空白（或填 `site`）
7. 點「Deploy」

等待 1-2 分鐘，Vercel 就會給你一個 `.vercel.app` 網址！

---

## 📝 如何新增報告

### 方法一：手動新增 Markdown 檔案

1. 在 `docs/reports/` 資料夾新增 `.md` 檔案
2. 檔名格式：`2026-04-30-my-report.md`
3. 內容格式：

```markdown
# 報告標題

日期：2026年4月30日

## 摘要

這是報告內容...

## 結論

報告結論...
```

4. 提交到 GitHub：
```bash
git add docs/reports/2026-04-30-my-report.md
git commit -m "新增：2026-04-30 報告"
git push
```

5. Vercel 會自動偵測並重新部署（約 1-2 分鐘）

---

### 方法二：使用部署腳本

```bash
cd ~/daily-reports-site

# 新增報告後執行
./deploy_to_vercel.sh
```

---

## ⚙️ 如何自訂網站

### 修改網站名稱

編輯 `mkdocs.yml`：
```yaml
site_name: 你的網站名稱
site_description: 你的網站描述
```

### 修改主題顏色

編輯 `mkdocs.yml`：
```yaml
theme:
  palette:
    - scheme: default
      primary: indigo  # 改成其他顏色：red, blue, green, purple, orange
      accent: blue
```

### 修改首頁內容

編輯 `docs/index.md`

---

## 🌐 自訂網域（可選）

1. 在 Vercel 的 Project Settings → Domains
2. 輸入你的網域（如 `reports.yoursite.com`）
3. 按指示設定 DNS 記錄
4. 等待驗證（約 24-48 小時）

---

## 🔧 常見問題

### Q：部署失敗怎麼辦？

檢查錯誤訊息，常見問題：
1. `pip install` 失敗 → 使用 `uv pip install --system`
2. 找不到 `site/` 目錄 → 確認 `mkdocs build` 有成功執行

### Q：如何確認網站更新了？

在 Vercel 的 Deployments 頁面查看最新部署狀態

### Q：可以不經過 GitHub 直接部署嗎？

可以，但需要在本機安裝 Vercel CLI：
```bash
npm install -g vercel
vercel --prod
```

---

## 📞 技術規格

| 項目 | 規格 |
|------|------|
| 靜態網站產生器 | MkDocs |
| 主題 | Material for MkDocs |
| 托管平台 | Vercel（免費）|
| 資料庫 | 無（純靜態）|
| 費用 | 免費（每月 100GB 流量以內）|

---

## 🎉 恭喜完成！

現在你有一個全自動的每日報告網站了！

只要把 Markdown 檔案放到 `docs/reports/`，提交到 GitHub，網站就會自動更新～

---

*最後更新：2026-04-30*
*川寶團隊 小安製作*