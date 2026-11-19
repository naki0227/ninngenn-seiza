# 開発・品質チェック

## 必要なもの
- Mac / Xcode（Swift 6 を使用可能なもの）
- XcodeGen（`brew install xcodegen`）
- Git / GitHub のアクセス権

## 起動
```bash
xcodegen generate
open NinngennSeiza.xcodeproj
```

`NinngennSeiza.xcodeproj` は生成物のため Git 管理しない。App は起動確認画面のみ。ゲーム画面はまだ存在しない。

## 検証
```bash
bash scripts/quality.sh
```

このスクリプトは `swift format lint` → `swift test` →（macOSのみ）`xcodegen generate` → iOS Simulator build を実行する。CIでも同内容をチェックする。

**2026-11-20 初期整備時の確認**: Swift 6.2.1 の Linux 環境で GameCore の format/lint とテスト1件は通過。macOS/Xcodeがないため iOS の実ビルドは未検証。GitHub Actions の実行結果も別途確認が必要。

## 守る品質
- 正常・異常・境界値のテストをルール実装に追加する
- 同じ入力と盤面で同じ結果になる再現性テストを将来追加する
- UIの変更にはスクリーンショット・操作動画をPRへ
- 外部依存や描画方式の採用はPRで理由と比較を記録
- CIが失敗した場合は原因を記載し、成功したと装わない

## コミットをまとめすぎない
CIの修正、ルール実装、描画試作、アート更新を目的ごとに分ける。ブランチとPRの手順は `CONTRIBUTING.md` に記載。
