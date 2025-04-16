#!/bin/bash

# エラー発生時にスクリプトを停止
set -e

# ルートディレクトリのパスを取得（スクリプトの場所から2階層上）
ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
# 出力ファイルパスを変数に設定（絶対パス）
INSTRUCTIONS_FILE="$ROOT_DIR/.vscode/instructions.md"

# 既存の .clinerules ディレクトリを削除して新規作成
rm -rf "$ROOT_DIR/.clinerules"
mkdir -p "$ROOT_DIR/.clinerules"

# .vscode ディレクトリが存在しない場合は作成
mkdir -p "$ROOT_DIR/.vscode"

# docs/rules 配下の .md ファイルをディレクトリ構造を維持したままコピー
cd "$ROOT_DIR/docs/rules"
find . -type f -name "*.md" -exec cp --parents {} ../../.clinerules/ \;
cd "$ROOT_DIR"

echo "Rules files have been copied to .clinerules directory successfully."

# ファイルを basename + path 順にソートして instructions.md に結合
rm -f "$INSTRUCTIONS_FILE" # 既存の instructions.md を削除

# ファイル名でソートしてから結合
cd "$ROOT_DIR/docs/rules"
find . -type f -name "*.md" | sort -t / -k 3,3 -k 1,2 | while read file; do
  # echo "## $(basename "$file" .md) - $file" >> "$INSTRUCTIONS_FILE"
  cat "$file" >> "$INSTRUCTIONS_FILE"
  echo "" >> "$INSTRUCTIONS_FILE"
done
cd "$ROOT_DIR"

echo "Rules files have been combined to $INSTRUCTIONS_FILE successfully."
