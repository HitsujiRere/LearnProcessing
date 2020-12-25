// メソッドを持ったクラス
class MyClass
{
  int x = 0, y = 0;

  MyClass(int _x, int _y)
  {
    x = _x;
    y = _y;
  }

  // 面積を返すメソッド
  int area()
  {
    return x * y;
  }

  // thisを用いるメソッド
  void set(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
}

// インスタンス化
MyClass instance = new MyClass(10, 20);

// メソッドを呼ぶ
println(instance.area());
instance.set(100, 100);

println(instance.x, instance.y);
