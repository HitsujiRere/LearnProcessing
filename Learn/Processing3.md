# クラス（Class）の基礎１

## 1. クラスの作成

コード : [Class_Single1.pde](../Code_Class_Single/Class_Single1/Class_Single1.pde)

クラスは，新しいデータ構造を作ることができるものです．

最も単純なクラスを作るには以下のようにします．

```java
class クラス名
{
}

class MyClass
{
}
```

実際にこのクラスを用いて，実物を作成（インスタンス化）するには，

```java
クラス名 インスタンス変数 = new クラス名();

MyClass instance = new MyClass();
````

とします．

## 2. フィールド

コード : [Class_Single2.pde](../Code_Class_Single/Class_Single2/Class_Single2.pde)

これだけでは使いようがありませんので，int型の変数 x と y を持たせたクラスを作成してみます．

```java
class MyClass
{
  // 値（初期化しなくてもよい）
  int x = 0;
  int y = 0;
}

MyClass instance = new MyClass();
```

この x や y のようなクラスの中の変数をフィールドと呼びます．

このクラスのフィールドにアクセスするには，

```java
インスタンス.フィールド

instance.x = 10;

println(instance.y);
```

これを利用する1つのメリットとして，複数の配列を1つの配列にすることができます．

```java
int[] valuesX = new int[100];
int[] valuesY = new int[100];
```

を

```java
MyClass[] instances = new MyClass[100];
```

にまとめることができます．

この配列にアクセスしてみると，

```java
println(instances[0].x);
```

```
NullPointerException
```

とエラーがでます．

この配列を作った時点では，配列の各要素はまだインスタンスが入っていないため，インスタンス化してあげる必要があります．

```java
for (int i = 0; i < instances.length; i++)
{
  instances[i] = new MyClass();
}

println(instances[0].x);
```

## 3. コンストラクタ

コード : [Class_Single3.pde](../Code_Class_Single/Class_Single3/Class_Single3.pde)

インスタンス化する際に，フィールドを変更して作成することができます．

```java
class MyClass
{
  int x = 0, y = 0;
  
  MyClass(int _x, int _y)
  {
    x = _x;
    y = _y;
  }
}

MyClass instance = new MyClass(10, 20);
```

このとき以下はエラーになります．

```java
MyClass instance = new MyClass();
```

なお，コンストラクタを書かなかった場合，自動的に

```java
MyClass() { }
```

というコンストラクタが生成されます．

また，関数のオーバーロードと同様に

```java
class MyClass
{
  ...

  MyClass()
  {
  }

  MyClass(int _x, int _y)
  {
    x = _x;
    y = _y;
  }
}
```

とコンストラクタを複数書くこともできます．

## 4. メソッド

コード : [Class_Single4.pde](../Code_Class_Single/Class_Single4/Class_Single4.pde)

classの中で関数を定義するのと同じように，

```java
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
}
```

という風にメソッドを書けます．

そして，呼び出すときは，

```java
インスタンス.メソッド名()

println(instance.area());
```

とします．

コンストラクタやメソッドの引数（パラメータ）に，フィールドと同じ名前を用いた場合，

```java
class MyClass
{
  ...

  // thisを用いるメソッド
  void set(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
}
```

`this`は自分自身のインスタンスを指します．

そのため，`this`を用いることで，フィールドにアクセスできます．
