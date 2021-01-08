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
