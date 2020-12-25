// フィールドを持ったクラス
class MyClass
{
  // 値（初期化しなくてもよい）
  int x = 0;
  int y = 0;
}

MyClass instance = new MyClass();

// フィールドへのアクセス
instance.x = 10;
println(instance.y);

// 配列にする
MyClass[] instances = new MyClass[100];

// エラー
println(instances[0].x);

// インスタンス化
for (int i = 0; i < instances.length; i++)
{
  instances[i] = new MyClass();
}

println(instances[0].x);
