#!/bin/bash
# ==============================================
# 川寶每日報告 - Vercel 部署腳本
# ==============================================
# 使用方式：
#   1. Vercel CLI 已安裝：vercel --prod
#   2. 或使用 Vercel API（需要 VERCEL_TOKEN）
# ==============================================

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo "=============================================="
echo "川寶每日報告 - Vercel 部署腳本"
echo "=============================================="
echo ""

# 檢查 site 目錄是否存在
if [ ! -d "site" ]; then
    echo "⚠️  site 目錄不存在，正在建立網站..."
    /Users/hsuehkaiyen/Library/Python/3.8/bin/mkdocs build
    echo "✅ 網站建立完成"
else
    echo "✅ site 目錄已存在"
fi

echo ""
echo "📦 準備部署到 Vercel..."
echo ""

# 嘗試使用 Vercel CLI
if command -v vercel &> /dev/null; then
    echo "🚀 偵測到 Vercel CLI，正在部署..."
    cd site
    vercel --prod --yes
else
    echo "⚠️  Vercel CLI 未安裝"
    echo ""
    echo "=============================================="
    echo "部署方式選擇"
    echo "=============================================="
    echo ""
    echo "方式一：使用 Vercel CLI（推薦）"
    echo "   npm install -g vercel"
    echo "   vercel --prod"
    echo ""
    echo "方式二：使用 Vercel API"
    echo "   請在 vercel.com 建立專案並取得 TOKEN"
    echo ""
    echo "方式三：手動上傳"
    echo "   1. 前往 https://vercel.com/new"
    echo "   2. 上傳 site/ 目錄的內容"
    echo ""
    echo "=============================================="
fi

echo ""
echo "📁 網站檔案位置："
echo "   $SCRIPT_DIR/site/"
echo ""
echo "💡 可以直接上傳這個資料夾到 Vercel"
echo "=============================================="