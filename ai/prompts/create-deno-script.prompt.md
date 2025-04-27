# Deno CLI Script 作成ルール

`./scripts/script-name.ts` に Deno CLI Script を作ってください。

## テンプレート

```ts
#!/usr/bin/env -S deno run -A --ext=ts
import { parseArgs } from 'node:util';
import $ from 'jsr:@david/dax@0.43.0';

// コマンド実行時に > ls みたいな形で出力する
$.setPrintCommand(true);

// 引数のパース
const parsed = parseArgs({
  args: Deno.args,
  options: {},
});

// run a command
await $`echo 5`; // outputs: 5

// outputting to stdout and running a sub process
await $`echo 1 && deno run main.ts`;

// Getting output
const result = await $`echo 1`.text();
console.log(result); // 1
```

## Deno ベストプラクティス

### コーディングポリシー

- コードのコメントとして、そのファイルがどういう仕様かを可能な限り明記する
- 実装が内部状態を持たないとき、 class による実装を避けて関数を優先する
- 外部依存を可能な限り減らして、一つのファイルに完結してすべてを記述する

### import

曖昧なバージョンの import を許可する。

優先順:

1. `jsr:` のバージョン固定
2. `jsr:`
3. `npm:`

`https://deno.land/x/*` は代替がない限りは推奨しない。

```ts
// OK
import $ from 'jsr:@david/dax@0.42.0';
import $ from 'jsr:@david/dax';
import { z } from 'npm:zod';

// Not Recommended
import * as cbor from 'https://deno.land/x/cbor';
```

## 作成後 実行権限を付与

```sh
chmod +x ./scripts/script-name.ts
```
