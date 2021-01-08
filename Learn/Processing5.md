# クラス（Class）の継承

## 1. 継承１

コード : [Class_Extends1.pde](../Code_Class_Extends/Class_Extends1/Class_Extends1.pde)

「継承」は，クラスから成るオブジェクト指向の重要な概念の1つです．

クラスとクラスの関係性であり，継承される側（基底）と継承するクラス（派生）があります．

基底クラスは親クラス，基本クラス，スーパークラスなど，
派生クラスは子クラス，サブクラスなどとも呼ばれます．

基底クラスを土台とし，新たに派生クラスを作成することができます．

クラスを継承するには，

```java
class 派生クラス名 extends 基底クラス名
{
    ...
}

class DerivedClass extends BaseClass
{
}
```

とします．

## 2. 継承２

コード : [Class_Extends2.pde](../Code_Class_Extends/Class_Extends2/Class_Extends2.pde)

基底クラスであるBaseClassにメソッドを追加してみます．

継承の便利なことの1つに，基底クラスのフィールドやメソッドを派生クラスでも使うことができるということです．

```java
// 基底クラス
class BaseClass
{
  int number = 123;

  void sayHello()
  {
    println("Hello!");
  }
}

// 派生クラス
class DerivedClass extends BaseClass
{
}

```

があるとして，実行してみると

```java
// 基底 <- 基底
BaseClass base = new BaseClass();
println(base.number);
base.sayHello();

// 派生 <- 派生
DerivedClass derived1 = new DerivedClass();
println(derived1.number);
derived1.sayHello();

// 基底 <- 派生
BaseClass derived2 = new DerivedClass();
println(derived2.number);
derived2.sayHello();
```

```
123
Hello!
123
Hello!
123
Hello!
```

と出力されるように，派生クラスにて使うことが出来ました．

## 3. オーバーライド

コード : [Class_Extends3.pde](../Code_Class_Extends/Class_Extends3/Class_Extends3.pde)

継承時，基底クラスで宣言されているメソッドを派生クラスにて別のメソッドに変更することができます．（オーバーライド） 

```java
// 基底クラス
class BaseClass
{
  int number = 123;

  void sayHello()
  {
    println("BaseClass: Hello! My number is", number);
  }
}

// 派生クラス
class DerivedClass extends BaseClass
{
  int number = 456;

  void sayHello()
  {
    println("DerivedClass: Hello! My number is", number);
  }
}
```

というように，フィールドとメソッドをそれぞれ派生クラスにてオーバーライドします．

```java
// 基底 <- 基底
println("基底 <- 基底");
BaseClass base = new BaseClass();
println("base.number = ", base.number);
base.sayHello();

// 派生 <- 派生
println("派生 <- 派生");
DerivedClass derived1 = new DerivedClass();
println("derived1.number = ", derived1.number);
derived1.sayHello();

// 基底 <- 派生
println("基底 <- 派生");
BaseClass derived2 = new DerivedClass();
println("derived2.number = ", derived2.number);
derived2.sayHello();
```

これを実行してみると

```
基底 <- 基底
base.number =  123
BaseClass: Hello! My number is 123
派生 <- 派生
derived1.number =  456
DerivedClass: Hello! My number is 456
基底 <- 派生
derived2.number =  123
DerivedClass: Hello! My number is 456
```

と出力されます．

「派生 <- 派生」では，実際にオーバーライドしたフィールド，メソッドが呼ばれているのを確認できます．

「基底 <- 派生」では，`derived2.number`は基底クラスのフィールドを呼び出し，`derived2.sayHello()`では派生クラスのオーバーライドしたメソッドを呼び出しており，`derived2.sayHello()`の中でのフィールド`number`は派生クラスのフィールドを呼び出しています．

これは，javaではインスタンスからフィールドを呼び出す際はそのインスタンスの現在の型を，メソッドを呼び出すときはオーバーライドされているものを呼び出すという仕様のためです．

## 4. super

コード : [Class_Extends4.pde](../Code_Class_Extends/Class_Extends4/Class_Extends4.pde)

派生クラスのメソッド内で，オーバーライドされる前のフィールドやメソッドを呼び出したい時があります．その時には

```java
super.フィールド名
super.メソッド名

super.number
super.sayHello
```

とします．

派生クラスでコンストラクタをオーバーライドしたとき，基底クラスのコンストラクタを呼び出すときには特別に

```java
super()
```

とします．

```java
// 基底クラス
class BaseClass
{
  int number = 123;

  int number2;

  BaseClass(int num)
  {
    number2 = num;
  }

  void sayHello()
  {
    println("Hello!!!");
  }
}

// 派生クラス
class DerivedClass extends BaseClass
{
  int number = 456;

  DerivedClass(int num)
  {
    // 基底クラスのコンストラクタを呼ぶ
    super(num);
  }

  void sayHello()
  {
    println("in DerivedClass sayHello()");

    // 基底クラスのメソッドを呼ぶ
    super.sayHello();

    // 通常のフィールドを呼ぶ（this.numberと等価）
    println("number", number);

    // 基底クラスのフィールドを呼ぶ
    println("super.number", super.number);
  }
}

// 基底 <- 派生
BaseClass derived = new DerivedClass(10);
derived.sayHello();
```

このコードを実行してみると，

```
in DerivedClass sayHello()
Hello!!!
number 456
super.number 123
```

というふうに出力され，実際にオーバーライドされる前のフィールド・メソッドを呼べていることを確認できます．

## 5. instanceof

基底クラスの変数に派生クラスのインスタンスを入れられるのはいいのですが，時々これは派生クラスのインスタンスなのかどうかを調べたい時があります．

そんなとき，

```
変数 instanceof クラス

value instanceof DerivedClass
```

とすると，その変数がそのクラス，もしくはそのクラスを継承したあるクラスのインスタンスかどうか調べることができます．返り値はboolean型です．

これを利用して基底型になっている派生クラスのインスタンスを派生型にします．

```java
// 基底クラス
class BaseClass
{
}

// 派生クラス
class DerivedClass extends BaseClass
{
  void sayHello()
  {
    println("Hello!");
  }
}
```

という基底クラスと派生クラスがあるとして，

```java
// 基底 <- 派生
BaseClass derived = new DerivedClass();

// 派生クラス型にキャスト
DerivedClass derivedToDerived = (DerivedClass)derived;
derivedToDerived.sayHello();
```

基底クラス型の派生クラスのインスタンスを，派生クラス型にキャストします．

キャストは，

```java
(型)変数

(int)number
```

で可能です．

これを実行すると


```
Hello!
```

とちゃんと派生クラス型にキャストできているのを確認できます．

では基底クラス型のインスタンスを派生クラス型にキャストしてみると，

```java
// 基底 <- 基底
BaseClass base = new BaseClass();

// 派生クラスのインスタンスではないのでエラー
DerivedClass baseToDerived = (DerivedClass)base;
```

```
ClassCastException: Class_Extends5$1BaseClass cannot be cast to Class_Extends5$1DerivedClass
```

とエラーが発生します．

では，基底クラス型のものが派生クラス型のインスタンスか調べてみます．

```java

// 基底 <- 基底
BaseClass base = new BaseClass();
println("base instanceof DerivedClass :", base instanceof DerivedClass);

// 基底 <- 派生
BaseClass derived = new DerivedClass();
println("derived instanceof DerivedClass :", derived instanceof DerivedClass);
```

```
base instanceof DerivedClass : false
derived instanceof DerivedClass : true
```

と，派生クラスのインスタンスかどうか調べることができます．
