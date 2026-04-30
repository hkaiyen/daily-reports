#!/bin/bash
# ==============================================
# 川寶每日報告 - 完成 GitHub + Vercel 部署
# ==============================================
# 使用方式：./complete_deploy.sh YOUR_GITHUB_PAT
# ==============================================

set -e

TOKEN="$1"
if [ -z "$TOKEN" ]; then
    echo "❌ 錯誤：請提供 GitHub Personal Access Token"
    echo "使用方法：./complete_deploy.sh YOUR_GITHUB_PAT"
    exit 1
fi

cd ~/.openclaw/workspace/reports_site

echo "=============================================="
echo "川寶每日報告 - 完成部署腳本"
echo "=============================================="
echo ""

# Step 1: Create GitHub repo via API
echo "📦 正在建立 GitHub repository..."
RESPONSE=$(curl -s -X POST \
    -H "Authorization: token $TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/user/repos \
    -d '{"name":"daily-reports","private":false,"description":"川寶每日報告網站","auto_init":false}')

if echo "$RESPONSE" | grep -q '"full_name"'; then
    echo "✅ GitHub repository 建立成功！"
else
    if echo "$RESPONSE" | grep -q '"name already exists"'; then
        echo "ℹ️  Repository 已存在，略過建立"
    else
        echo "❌ 建立失敗：$RESPONSE"
        exit 1
    fi
fi

# Step 2: Update remote URL with token
echo ""
echo "🔗 設定 Git remote..."
git remote set-url origin "https://hkaiyen:${TOKEN}@github.com/hkaiyen/daily-reports.git"

# Step 3: Push to GitHub
echo ""
echo "📤 推送程式碼到 GitHub..."
git push -u origin master

echo ""
echo "=============================================="
echo "✅ GitHub 部署完成！"
echo "=============================================="
echo ""
echo "🌐 下一步："
echo "   1. 前往 https://vercel.com/new"
echo "   2. 點擊 'Import Git Repository'"
echo "   3. 選擇 'daily-reports' repository"
echo "   4. Framework: Other"
echo "   5. Build Command: pip install mkdocs && mkdocs build"
echo "   6. Output Directory: site"
echo "   7. 點擊 Deploy"
echo ""
echo "📌 Vercel 部署完成後請回報，小安會幫你確認設定是否正確"
echo "=============================================="
