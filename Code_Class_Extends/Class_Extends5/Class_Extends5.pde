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

// 基底 <- 基底
println("基底 <- 基底");
BaseClass base = new BaseClass();
println("base instanceof BaseClass :", base instanceof BaseClass);
println("base instanceof DerivedClass :", base instanceof DerivedClass);

// 派生クラスのインスタンスではないのでエラー
//DerivedClass baseToDerived = (DerivedClass)base;

// 基底 <- 派生
println("基底 <- 派生");
BaseClass derived = new DerivedClass();
println("derived instanceof BaseClass :", derived instanceof BaseClass);
println("derived instanceof DerivedClass :", derived instanceof DerivedClass);

// 派生クラス型にキャスト
DerivedClass derivedToDerived = (DerivedClass)derived;
derivedToDerived.sayHello();
