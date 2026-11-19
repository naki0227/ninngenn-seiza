# 構成と設計方針

```text
.
├── App/                         # iOS / SwiftUI の起動用UIのみ（ゲーム画面は未実装）
├── Packages/
│   └── GameCore/                # 表示技術に依存しないルール
│       ├── Sources/GameCore/
│       └── Tests/GameCoreTests/
├── .github/                     # CI と PRテンプレート
├── scripts/                     # 品質検査
├── docs/                        # 仕様・決定・作業ログ
├── project.yml                  # XcodeGen のプロジェクト定義
├── AGENTS.md                    # 開発エージェントの指示
└── CLAUDE.md                    # AGENTS.md の参照
```

## 技術の採用状況
- Swift / SwiftUI / SwiftPM: **採用**。GameCore の単体テストを描画なしで実行できる。
- XcodeGen: **採用**。バージョン管理対象をテキストにし、両担当のプロジェクト設定を揃えるため。追加ツールとCIインストールコストがある。
- SpriteKit（2D）/ RealityKit（3D）: **未採用**。最初のプロトタイプの結果を見てから選ぶ。
- 外部パッケージ: **未導入**。新規依存は代替・保守コスト・ライセンスを確認してから。

描画、物理演出、ゲームルール、入力を混ぜない。実装初期に過剰な protocol / layer を追加せず、具体的な責務が現れたときだけ分割する。

## 再現性の条件
「同条件・同結果」は、投入入力だけでなく **初期盤面、先行する2体の状態、更新順序** を含めて比較する。最終ポーズの決定を描画フレームレートに依存させない方針。具体的な数学・判定方式はプロトタイプで検証する。

設計上の背景は [ADR 0001](decisions/0001-swift-renderer-neutral-base.md)。
