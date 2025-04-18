#!/bin/bash

# WordPressプラグインテンプレート初期化スクリプト

# 対話形式で情報を取得する関数
get_info() {
    # プラグイン名の取得（現在のディレクトリ名がデフォルト）
    DIR_NAME=$(basename "$(pwd)")
    FORMATTED_DIR_NAME=$(echo "$DIR_NAME" | tr '-' ' ' | sed -e 's/\b\(.\)/\u\1/g')
    PLUGIN_NAME="$FORMATTED_DIR_NAME"

    # 確認
    echo ""
    echo "以下の情報でプラグインを初期化します："
    echo "プラグイン名: $PLUGIN_NAME"
    read -p "これらの情報で初期化を続けますか？ [Y/n]: " CONFIRM
    if [[ $CONFIRM =~ ^[Nn] ]]; then
        echo "初期化がキャンセルされました。"
        exit 0
    fi
}

# コマンドライン引数の処理
PLUGIN_NAME="${1}"

# 対話形式で情報を取得
get_info

echo "プラグイン: $PLUGIN_NAME の初期化を行います..."

# Gitリポジトリのリセット
echo "Gitリポジトリをリセットしています..."
rm -rf .git
git init > /dev/null

# package.jsonの更新
echo "package.jsonを更新しています..."
# プラグイン名を小文字かつハイフン区切りの形式に変換（package.jsonで使用する形式）
PACKAGE_NAME=$(echo "$PLUGIN_NAME" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
# package.jsonファイル内の"wp-plugin-template"を$PACKAGE_NAMEに置換
sed -i '' "s/wp-plugin-template/$PACKAGE_NAME/g" package.json

# 依存関係のインストール
echo "依存関係をインストールしています..."
npm install

echo "初期化が完了しました！"
echo "新しいプラグイン: $PLUGIN_NAME の開発を始めることができます。"
echo ""
echo "WordPress環境を起動するには："
echo "npx wp-env start"
