// 敵
class Enemy
{
  // 敵のX座標, Y座標
  float x, y;
  // 敵の速度のX座標, Y座標
  float speedX, speedY;
  // 敵の半径
  float scale;

  // コンストラクタ
  Enemy()
  {
    x = width / 2;
    y = 0;
    speedX = random(5, 10);
    speedY = random(5, 10);
    scale = random(16, 32);
  }

  void update()
  {
    // 敵の移動
    x += speedX;
    y += speedY;

    // 壁に当たったら跳ね返る
    if (x < 0 || width < x)
    {
      speedX *= -1;
    }
    if (y < 0 || height < y)
    {
      speedY *= -1;
    }
  }

  void display()
  {
    resetDrawingSettings();  
    fill(255, 0, 0);
    ellipse(x, y, scale * 2, scale * 2);
  }

  // 当たり判定
  boolean isCrashed(float anotherX, float anotherY, float anotherScale)
  {
    return dist(anotherX, anotherY, x, y) <= anotherScale + scale;
  }
}
