今回の作業のコミット履歴を `git log main..HEAD | cat` で確認してください。
今回の作業を振り返り Pull Request の本文を簡潔にまとめて `ai-out/pr/(yyyy-MM-dd)-(branch).md` に作ってください。一行目にPRのタイトルを書いてください。

あなたがファイル作成後、私が本文用のファイルを確認して編集、保存します。

下記のコマンド で Pull Request を作成してください。

```
bash -c 'read -n 1 -p "続けるには何かキーを押してください..."' && git pushup && bash -c 'PR_FILE="(filename)"; gh pr create --title "$(head -n 1 "$PR_FILE")" --body "$(tail -n +2 "$PR_FILE")"' && gh pr view --web
```
