# ai-rules-template

自分用の AI ルールテンプレート

## コピーして使う

```
bash -c "$(cat <<- 'EOF'
# 一時ディレクトリを作成
TEMP_DIR=$(mktemp -d)
echo "一時ディレクトリを作成しました: $TEMP_DIR"

# リポジトリをクローン
echo "リポジトリをクローンしています..."
git clone git@github.com:hushin-sandbox/ai-rules-template.git "$TEMP_DIR/repo"

# docsフォルダと.vscodeフォルダをコピー
echo "指定されたフォルダをコピーしています..."
if [ -d "$TEMP_DIR/repo/docs" ]; then
  cp -r "$TEMP_DIR/repo/docs" .
  echo "docs フォルダをコピーしました"
fi

if [ -d "$TEMP_DIR/repo/.vscode" ]; then
  cp -r "$TEMP_DIR/repo/.vscode" .
  echo ".vscode フォルダをコピーしました"
fi

# .gitignoreを追記
if [ -f "$TEMP_DIR/repo/.gitignore" ]; then
  echo "" >> .gitignore
  echo "# 追加された.gitignoreの内容" >> .gitignore
  cat "$TEMP_DIR/repo/.gitignore" >> .gitignore
  echo ".gitignore を更新しました"
fi

# 一時ディレクトリを削除
rm -rf "$TEMP_DIR"
echo "一時ディレクトリを削除しました"

echo "処理が完了しました"
EOF
)"
```

## 各種 AI ルールファイルを生成

```sh
./docs/scripts/generate-ai-rules.sh
```
