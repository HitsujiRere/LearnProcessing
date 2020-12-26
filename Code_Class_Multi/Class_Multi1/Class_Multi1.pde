class MyClass
{
  int x = 0, y = 0;

  MyClass(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
}

// リストを作成する
ArrayList<MyClass> list1;
list1 = new ArrayList();

// 以下でも可能
ArrayList<MyClass> list2 = new ArrayList<MyClass>();
ArrayList<MyClass> list3 = new ArrayList<>();

// インスタンスを追加する
list1.add(new MyClass(1, 2));

// 
println(list1.get(0).x);
