// レインボーな敵
class EnemyRainbow extends Enemy
{
  // 色相
  color hue;

  // コンストラクタ
  EnemyRainbow()
  {
    super();

    hue = 0;
  }

  void update()
  {
    super.update();

    hue = (hue + 1) % 256;
  }

  void display()
  {
    colorMode(HSB);
    fill(hue, 255, 255);
    ellipse(x, y, scale * 2, scale * 2);

    colorMode(RGB);
  }
}
