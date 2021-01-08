// 図形
class Figure
{
  void display()
  {
  }
}

// 長方形
class Rect extends Figure
{
  float x, y, w, h;

  Rect(float x, float y, float w, float h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  @Override
    void display()
  {
    rect(x, y, w, h);
  }
}

// 楕円
class Ellipse extends Figure
{
  float x, y, w, h;

  Ellipse(float x, float y, float w, float h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  @Override
    void display()
  {
    ellipse(x, y, w, h);
  }
}

// 図形のリスト
ArrayList<Figure> figures;

void setup()
{
  size(640, 640);

  figures = new ArrayList<Figure>();

  figures.add(new Rect(100, 200, 300, 400));
  figures.add(new Ellipse(100, 100, 100, 100));
}

void draw()
{
  background(0);

  // 描画
  for (Figure figure : figures)
  {
    figure.display();
  }
}

void keyPressed()
{
  if (key == '1')
  {
    // ランダムな長方形を追加
    figures.add(new Rect(random(width), random(height), random(width), random(height)));
  }

  if (key == '2')
  {
    // ランダムな楕円を追加
    figures.add(new Ellipse(random(width), random(height), random(width), random(height)));
  }

  if (key == '3')
  {
    // 長方形だけ上に移動させる
    for (Figure figure : figures)
    {
      if (figure instanceof Rect)
      {
        Rect rect = (Rect)figure;
        rect.y -= 5;
      }
    }
  }
}
