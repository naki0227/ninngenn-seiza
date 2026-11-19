# ぺたっと星座（仮）

iOS 向けの3Dモデルを用いた、2D操作の物理パズルゲームの作業リポジトリです。

- **現在の状態**: 開発基盤の初期化。ゲームプレイは未実装。
- **ゲームの詳細仕様**: `docs/` で検討し、確定後に実装します。
- **開発環境**: Unity 6.3 LTS / C# を候補として構成しています。必要な Unity Editor の版は `ProjectSettings/ProjectVersion.txt` を参照。
- **対象**: iOS。ローカルの最終ビルドには macOS、Xcode、Unity iOS Build Support が必要です。

## 開発の進め方

1. Unity Hub から該当バージョンの Unity Editor をインストールし、このディレクトリを開く。
2. `Assets/` 以下へ Scene、モデル、C# コード、テストを追加する。`Library/`、`Temp/`、`Builds/` はコミットしない。
3. 変更ごとに Unity EditMode テスト、コンパイル、ビルド検査を行い、GitHub Actions で確認する。

CI の起動条件と初期化時に未検証の項目は `docs/DEVELOPMENT.md` を参照。
