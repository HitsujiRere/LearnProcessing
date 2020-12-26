// ジェネリック
class MyClass<T>
{
  T value;

  MyClass(T value)
  {
    this.value = value;
  }

  void write()
  {
    println(value.toString());
  }
}

MyClass<String> instance = new MyClass<String>("aiueo");

instance.write();
