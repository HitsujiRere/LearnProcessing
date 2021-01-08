// 基底クラス
class BaseClass
{
}

// 派生クラス
class DerivedClass extends BaseClass
{
}

// 基底クラスのインスタンス
BaseClass base = new BaseClass();

// 派生クラスのインスタンス
DerivedClass derived1 = new DerivedClass();

// 派生クラスのインスタンスを基底クラスとして扱う
BaseClass derived2 = new DerivedClass();
