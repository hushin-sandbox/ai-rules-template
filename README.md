# ai-rules-template

自分用の AI ルールテンプレート

## コピーして使う

```
bash -c "$(cat <<- 'EOF'
TEMP_DIR=$(mktemp -d)
echo "一時ディレクトリを作成しました: $TEMP_DIR"

echo "リポジトリをクローンしています..."
git clone git@github.com:hushin-sandbox/ai-rules-template.git "$TEMP_DIR/repo"

echo "指定されたフォルダをコピーしています..."
cp -r "$TEMP_DIR/repo/ai" .
echo "ai フォルダをコピーしました"

cp -r "$TEMP_DIR/repo/.vscode" .
echo ".vscode フォルダをコピーしました"

echo "" >> .gitignore
cat "$TEMP_DIR/repo/.gitignore" >> .gitignore
echo ".gitignore を更新しました"

rm -rf "$TEMP_DIR"
echo "一時ディレクトリを削除しました"

echo "処理が完了しました"
EOF
)"
```

## 各種 AI ルールファイルを生成

```sh
./ai/scripts/generate-ai-rules.sh
```
