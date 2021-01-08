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
