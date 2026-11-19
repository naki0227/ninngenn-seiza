# 共同開発ガイド（はじめてのGitHub向け）

このプロジェクトは、**まず朝日くんとイブキがそれぞれ別々に1本ずつプロトタイプを作り、比較する**進め方です。全員のコードをすぐ混ぜることが目的ではありません。

## 1. ブランチとは？
ブランチは「同じコードから分けた作業コピー」のようなものです。

- `main`：共有の基盤。ゲーム実装をすぐ入れない。
- `asahi-dev`：朝日くんの試作を積み上げる場所。
- `ibuki-dev`：イブキの試作を積み上げる場所。
- `docs/game-design`：仕様検討用。2D/3Dなど未決の案を記録する場所。

最初は2人とも **同じ `main` の状態からスタート**します。別の人の試作ブランチには書き込まないでください。

## 2. 最初の準備（Mac）
1. Git、Xcode をインストールする。
2. リポジトリをコピーする: `git clone https://github.com/naki0227/ninngenn-seiza.git`
3. `cd ninngenn-seiza` を実行する。
4. `brew install xcodegen` → `xcodegen generate` でXcodeプロジェクトを生成する。
5. `open NinngennSeiza.xcodeproj` で開く。
6. `bash scripts/quality.sh` を実行して、最低限の検査が動くことを確かめる。

## 3. 自分のブランチで作業する

朝日くん:
```bash
git fetch origin
git switch asahi-dev
git pull --ff-only origin asahi-dev
```

イブキ:
```bash
git fetch origin
git switch ibuki-dev
git pull --ff-only origin ibuki-dev
```

`git branch --show-current` でブランチ名を確認してから変更する。エディタに表示されるブランチ名にも注意。

小さな変更なら自分の `*-dev` にコミットしてもよい。レビューを受けたい・作業が大きい場合は次の機能ブランチを切るのを推奨:

```bash
# 朝日くんの例（ibukiなら ibuki-dev と feat/ibuki/xxx を使う）
git switch asahi-dev
git switch -c feat/asahi/first-throw
# ここでコードを変更
git status
git add App Packages docs
git commit -m "feat: add first throw prototype"
git push -u origin feat/asahi/first-throw
```

## 4. PR（Pull Request）とは？
「この変更をどのブランチに取り込むか、レビューしてほしい」という依頼です。

GitHubのリポジトリ → **Pull requests** → **New pull request** から作成します。

**必ず次の設定にする:**

| 誰のPRか | base（取り込み先） | compare（変更側） |
| --- | --- | --- |
| 朝日くんのプロトタイプ | `asahi-dev` | `feat/asahi/...` |
| イブキのプロトタイプ | `ibuki-dev` | `feat/ibuki/...` |
| 共有CIや基盤の変更 | `main` | `chore/...` など |
| 仕様の検討 | `docs/game-design` | `docs/...` など |

**朝日くん・イブキの試作を `main` に向けたPRにしない。** 作り間違えたら、マージする前に `Edit` で base を修正する。

PRには `Why`（なぜ） / `What`（何を） / `How to check`（確認方法）を書き、ゲーム画面を変えた場合は画像や動画も添える。CIのチェックが赤いときは理由を確認してからマージする。

## 5. コミットとは？
コミットは変更の「セーブポイント」です。小さな単位で残します。

```bash
git status
git add <変更したファイル>
git commit -m "fix: correct throw direction"
git push
```

コミットメッセージ例:
- `feat: show constellation targets`
- `test: verify identical input gives identical pose`
- `fix: avoid invalid throw strength`
- `docs: record prototype findings`
- `chore: update CI`

生成ファイル、シークレット、不要な素材を含めない。初めてのGit操作で迷ったら `git status` を確認し、`--force` や `reset --hard` を使わず相談する。

## 6. プロトタイプを比較した後
1. `asahi-dev` と `ibuki-dev` をそれぞれ実機かシミュレータでプレイする。
2. 操作性・楽しさ・再現性・開発コストを同じ観点で比較する。
3. 採用する仕組みを決める。片方を丸ごと採用する必要はない。
4. **最新の `main` から新たな統合用ブランチを切る。**
5. 採用したコード・テストだけを移植し、`main` にPRを作る。
6. 両プロトタイプのブランチは比較記録として残す。勝手に削除しない。

このルールは共同作業で混乱しないための初期案。変更したいときは、2人で合意してドキュメントを先に直す。
