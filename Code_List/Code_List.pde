// ゲームの状態
// 0: ゲーム中
// 1: 終了
int gameState;

// プレイヤーのX座標, Y座標
float playerX, playerY;
// プレイヤーの半径
float playerScale;

// 敵の数
int enemiesCount;
// 敵のX座標, Y座標
FloatList enemiesX, enemiesY;
// 敵の速度のX座標, Y座標
FloatList enemiesSpeedX, enemiesSpeedY;
// 敵の半径
FloatList enemiesScale;

void setup()
{
  size(640, 640);

  gameState = 0;

  playerX = width / 2;
  playerY = height / 2;
  playerScale = 16;

  enemiesCount = 0;
  enemiesX = new FloatList();
  enemiesY = new FloatList();
  enemiesSpeedX = new FloatList();
  enemiesSpeedY = new FloatList();
  enemiesScale = new FloatList();
}

void draw()
{
  update();

  display();
}

// 更新
void update()
{
  if (gameState == 0)
  {
    // プレイヤーの移動
    playerX = mouseX;
    playerY = mouseY;

    // 敵の追加
    if (frameCount % 60 == 0)
    {
      enemiesX.append(width / 2);
      enemiesY.append(0);
      enemiesSpeedX.append(random(5, 10));
      enemiesSpeedY.append(random(5, 10));
      enemiesScale.append(random(16, 32));
      enemiesCount++;
    }

    for (int i = 0; i < enemiesCount; ++i)
    {
      // 敵の移動
      enemiesX.add(i, enemiesSpeedX.get(i));
      enemiesY.add(i, enemiesSpeedY.get(i));

      // 壁に当たったら跳ね返る
      if (enemiesX.get(i) < 0 || width < enemiesX.get(i))
      {
        enemiesSpeedX.mult(i, -1);
      }
      if (enemiesY.get(i) < 0 || height < enemiesY.get(i))
      {
        enemiesSpeedY.mult(i, -1);
      }

      // 当たり判定
      if (dist(playerX, playerY, enemiesX.get(i), enemiesY.get(i)) <= playerScale + enemiesScale.get(i))
      {
        // 終了する
        gameState = 1;
      }
    }
  }
}

// 描画
void display()
{
  background(0);

  // プレイヤー
  resetDrawingSettings();  
  fill(255, 255, 255);
  ellipse(playerX, playerY, playerScale * 2, playerScale * 2);

  // 敵
  resetDrawingSettings();
  fill(255, 0, 0);
  for (int i = 0; i < enemiesCount; ++i)
  {
    ellipse(enemiesX.get(i), enemiesY.get(i), enemiesScale.get(i) * 2, enemiesScale.get(i) * 2);
  }

  if (gameState == 1)
  {
    // 終了という文字
    fill(255, 255, 255);
    resetDrawingSettings();
    text("Game End!", width / 2, height / 2);
  }
}

// 描画の設定をリセットする
void resetDrawingSettings()
{
  noStroke();
  noFill();
  textSize(48);
  textAlign(CENTER, CENTER);
}
