// ゲームの状態
// 0: ゲーム中
// 1: 終了
int gameState = 0;

// プレイヤーのX座標, Y座標
float playerX, playerY;
// プレイヤーの半径
float playerScale;

// 敵のX座標, Y座標
float enemyX, enemyY;
// 敵の速度のX座標, Y座標
float enemySpeedX, enemySpeedY;
// 敵の半径
float enemyScale;

void setup()
{
  size(640, 640);

  gameState = 0;

  playerX = width / 2;
  playerY = height / 2;
  playerScale = 16;

  enemyX = width / 2;
  enemyY = 0;
  enemySpeedX = random(5, 10);
  enemySpeedY = random(5, 10);
  enemyScale = random(16, 32);
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

    // 敵の移動
    enemyX += enemySpeedX;
    enemyY += enemySpeedY;

    // 壁に当たったら跳ね返る
    if (enemyX < 0 || width < enemyX)
    {
      enemySpeedX *= -1;
    }
    if (enemyY < 0 || height < enemyY)
    {
      enemySpeedY *= -1;
    }

    // 当たり判定
    if (dist(playerX, playerY, enemyX, enemyY) <= playerScale + enemyScale)
    {
      // 終了する
      gameState = 1;
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
  ellipse(enemyX, enemyY, enemyScale * 2, enemyScale * 2);

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
