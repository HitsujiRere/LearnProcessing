// コンストラクタを持ったクラス
class MyClass
{
  int x = 0, y = 0;

  // コンストラクタ
  MyClass(int _x, int _y)
  {
    x = _x;
    y = _y;
  }
}

// エラー
//MyClass instance = new MyClass();

// インスタンス化
MyClass instance = new MyClass(10, 20);

println(instance.x, instance.y);
