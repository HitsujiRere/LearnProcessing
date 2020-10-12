// ゲームの状態
// 0: ゲーム中
// 1: 終了
int gameState = 0;

// プレイヤーのX座標, Y座標
float playerX, playerY;
// プレイヤーの半径
float playerScale;

// 敵の数
int enemiesCount;
// 敵のX座標, Y座標
float[] enemiesX, enemiesY;
// 敵の速度のX座標, Y座標
float[] enemiesSpeedX, enemiesSpeedY;
// 敵の半径
float[] enemiesScale;

void setup()
{
  size(640, 640);

  gameState = 0;

  playerX = width / 2;
  playerY = height / 2;
  playerScale = 16;

  enemiesCount = 10;
  enemiesX = new float[enemiesCount];
  enemiesY = new float[enemiesCount];
  enemiesSpeedX = new float[enemiesCount];
  enemiesSpeedY = new float[enemiesCount];
  enemiesScale = new float[enemiesCount];
  for (int i = 0; i < enemiesCount; ++i)
  {
    enemiesX[i] = width / 2;
    enemiesY[i] = 0;
    enemiesSpeedX[i] = random(5, 10);
    enemiesSpeedY[i] = random(5, 10);
    enemiesScale[i] = random(16, 32);
  }
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

    for (int i = 0; i < enemiesCount; ++i)
    {
      // 敵の移動
      enemiesX[i] += enemiesSpeedX[i];
      enemiesY[i] += enemiesSpeedY[i];

      // 壁に当たったら跳ね返る
      if (enemiesX[i] < 0 || width < enemiesX[i])
      {
        enemiesSpeedX[i] *= -1;
      }
      if (enemiesY[i] < 0 || height < enemiesY[i])
      {
        enemiesSpeedY[i] *= -1;
      }

      // 当たり判定
      if (dist(playerX, playerY, enemiesX[i], enemiesY[i]) <= playerScale + enemiesScale[i])
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
    ellipse(enemiesX[i], enemiesY[i], enemiesScale[i] * 2, enemiesScale[i] * 2);
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
