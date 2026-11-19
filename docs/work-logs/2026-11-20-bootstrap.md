# 作業記録: Swiftベースと共同開発ルール

- 記録日時: 2026年11月20日 01時00分29秒（JST、作業中に取得）
- 目的: 2人が独立に比較可能なiOSゲームの基盤を整備
- 変更: README、SwiftUI最小アプリ、GameCore SwiftPMとテスト、XcodeGen、CI、品質スクリプト、AGENTS/CLAUDE/CONTRIBUTING、仕様・ADR・Todo
- 設計: 2D/3Dを決めず、ゲームルールはSwift Packageへ分離。mainと個別試作を分離する。
- 影響: 以前のUnity仮案は採用せず、Swiftへ訂正。ゲームプレイ本体は未着手。
- 実行済み: Swift 6.2.1 (Linux) `swift format lint --strict --recursive` / `swift test --package-path Packages/GameCore`、テスト1件成功
- 未実行: macOS/Xcodeを要するiOSシミュレータビルド、GitHub Actionsの実行成否確認、実機確認
- 未解決: 2D/3D、正確なポーズ算出、スコア、GitHub共同作業者の権限
- 次にやること: `docs/PROTOTYPE_BRIEF.md` と `CONTRIBUTING.md` を確認し、各devブランチで独立試作
- 次回最初に読む: `README.md`、`AGENTS.md`、`docs/TODO.md`
- 次回コマンド: `git branch --show-current`、`bash scripts/quality.sh`
- 注意: PRのbaseは朝日=asahi-dev、イブキ=ibuki-dev。比較までmainに取り込まない。
