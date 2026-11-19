# ぺたっと星座！（仮）

人型の粘着おもちゃを3体投げて星座を作る **iOSゲーム** のリポジトリ。

> 現在は開発基盤のみ。ゲームプレイは未実装です。

## 現時点の方針

- **Swift** で開発する。
- UI は **SwiftUI**、共通のゲームルールは **GameCore（Swift Package）** に置く。
- **2D / 3D の描画方式は未決定**。最初は2Dプロトタイプを想定するが、SpriteKit / RealityKit は現時点で導入しない。
- 同じ初期状態と同じ入力系列なら同じ投擲結果になる設計を目指す。

## ブランチ

| ブランチ | 目的 |
| --- | --- |
| `main` | CI・共通基盤と、合意後に採用した成果だけ |
| `asahi-dev` | 朝日くんの独立プロトタイプ |
| `ibuki-dev` | イブキの独立プロトタイプ |
| `docs/game-design` | ゲーム企画・未決事項の検討 |

**2人とも同じ `main` を起点に試作し、比較までお互いの実装を統合しない。**

## 開始方法

Mac の Xcode（Swift 6 対応）と [XcodeGen](https://github.com/yonaskolb/XcodeGen) が必要。

```bash
brew install xcodegen
xcodegen generate
open NinngennSeiza.xcodeproj
bash scripts/quality.sh
```

詳しい共同開発の手順は **[CONTRIBUTING.md](CONTRIBUTING.md)**、ゲームの共通条件は [docs/PROTOTYPE_BRIEF.md](docs/PROTOTYPE_BRIEF.md)、構成は [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) を参照。
