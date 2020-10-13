// ゲームの状態
// 0: ゲーム中
// 1: 終了
int gameState = 0;

// プレイヤーのX座標, Y座標
float playerX, playerY;
// プレイヤーの半径
float playerScale;

// 敵
ArrayList<Enemy> enemies;

void setup()
{
  size(640, 640);

  gameState = 0;

  playerX = width / 2;
  playerY = height / 2;
  playerScale = 16;

  enemies = new ArrayList();
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
      // 50%の確率で通常の，それ以外でレインボーなものを追加する
      if (random(1.0) >= 0.5)
      {
        enemies.add(new Enemy());
      } else
      {
        enemies.add(new EnemyRainbow());
      }
    }

    for (Enemy enemy : enemies)
    {
      // 敵の移動
      enemy.update();

      // 当たり判定
      if (enemy.isCrashed(playerX, playerY, playerScale))
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
  for (Enemy enemy : enemies)
  {
    enemy.display();
  }

  if (gameState == 1)
  {
    // 終了という文字
    resetDrawingSettings();
    fill(255, 255, 255);
    text("Game End!", width / 2, height / 2);
  }
}

// 描画の設定をリセットする
void resetDrawingSettings()
{
  colorMode(RGB);
  noStroke();
  noFill();
  textSize(48);
  textAlign(CENTER, CENTER);
}
