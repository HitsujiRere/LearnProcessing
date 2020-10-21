# Code_base

[目次](../Learn.md)

[ソースコード(Github)](https://github.com/HitsujiRere/LearnProcessing/tree/main/Code_base)

## コードについて

- マウスに追従する白い円を，敵である赤い円に当たらないように操作するゲーム

- プレイヤー
    - ``` playerX ``` : X座標
    - ``` playerY ``` : Y座標
    - ``` playerScale ``` : 半径

- 敵
    - ``` enemyX ``` : X座標
    - ``` enemyY ``` : Y座標
    - ``` enemySpeedX ``` : 速度のX
    - ``` enemySpeedY ``` : 速度のY
    - ``` enemyScale ``` : 半径

- 流れ
    1. ``` setup() ```
        - 最初に1度だけ呼ばれる
        - ここで初期化する

    2. ``` draw() ```
        - 毎フレーム呼ばれる

        1. ``` update() ```
            - 値の更新をする

        2. ``` display() ```
            - 描画を行う
