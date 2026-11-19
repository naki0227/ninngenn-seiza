# AIエージェント作業ルール

この文書は ChatGPT / Claude / Claude Code / Codex など、リポジトリを扱うすべての開発エージェント向けです。初心者にも理解できる差分・説明・手順を優先します。

## 最初に読むもの
1. `README.md`（全体方針）
2. `CONTRIBUTING.md`（ブランチ、コミット、PR）
3. `docs/PROTOTYPE_BRIEF.md`（ゲームの合意事項・未決事項）
4. `docs/ARCHITECTURE.md` と `docs/DEVELOPMENT.md`（構成・検証）
5. `docs/TODO.md`（次にやること）

## 守ること
- 言語は Swift。描画方式は **2D / 3D 未決定**。本人の許可なしに確定したり、SpriteKit / RealityKit / Unity を追加しない。
- プロトタイプは **朝日くん = `asahi-dev`、イブキ = `ibuki-dev`**。作業を始める前に自分が正しいブランチにいるか確認する。
- `main` へプロトタイプを直接コミット・マージしない。二案を比較してから採用コードを分離する。
- 朝日くんの変更は `asahi-dev` をベースにPR、イブキの変更は `ibuki-dev` をベースにPRを作る。**PR作成時に base を必ず確認する。**
- `Packages/GameCore` は表示・UIフレームワークに依存させない。ルール・入力・スコア計算など、描画を替えても残る処理だけを置く。
- 実装は小さな差分とし、仕様変更・依存追加・大規模改修は先に理由と影響を説明する。1ファイル300行程度を目安にする。
- バグ修正やルール変更はテストを追加し、正常・異常・境界値を検証する。
- `bash scripts/quality.sh` を実行し、実施できなかった検証は成功と書かない。
- 秘密情報・個人情報・開発者の個人証明書をコミットしない。
- 開発後に `docs/TODO.md` と作業ログを更新する。検討事項は事実・確定・提案を区別する。

## コミット・PR
- 例: `feat: add throw preview`、`test: cover angle boundaries`、`fix: keep pose stable`、`docs: clarify prototype goals`、`chore: configure CI`。
- **原則1コミット1目的**。動作する小単位で分け、デザイン・ゲームロジック・CI整備を不用意に混ぜない。
- PRは `Why` / `What` / `How to check` を簡潔に書く。スクリーンショットや録画は見た目変更時に添付する。
- PRを開いただけでは `main` へ入らない。マージ先を確認し、CI結果と差分をレビューする。
- 操作に迷ったら破壊的コマンド（`git reset --hard`、強制push、他人のブランチ削除）は実行しない。

共通知識の正本は Private `naki0227/personal-knowledge`。アクセス可能なら同リポジトリの `AGENTS.md` / `Knowledge-Capture-Workflow` に従って関連ノートを確認する。作業固有のTodo・ADR・作業ログはこのリポジトリに残す。
