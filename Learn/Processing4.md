# クラス（Class）の基礎２

## 1. ArrayList

コード : [Class_Multi1.pde](../Code_Class_Multi/Class_Multi1/Class_Multi1.pde)

リストをクラスで使うには，ArrayListを用います．

```java
class MyClass
{
  int x = 0, y = 0;
}

// リストを作成する
ArrayList<MyClass> list1;
list1 = new ArrayList();

// 以下でも可能
ArrayList<MyClass> list2 = new ArrayList<MyClass>();
ArrayList<MyClass> list3 = new ArrayList<>();
```

ArrayListを用いてリストを作成するには，

```java
ArrayList<型> リスト = new ArrayList();

ArrayList<MyClass> list1 = new ArrayList();
```

とします．

このArrayListを用いたリストに追加するには，

```java
リスト.add(追加するもの)

list.add(new MyClass());
```

とできます．

取得や削除など他の操作については，IntListなどとほぼ同じなので，他の方の記事をおすすめします．

<http://mslabo.sakura.ne.jp/WordPress/make/processing%E3%80%80%E9%80%86%E5%BC%95%E3%81%8D%E3%83%AA%E3%83%95%E3%82%A1%E3%83%AC%E3%83%B3%E3%82%B9/%E9%85%8D%E5%88%97%E5%A4%89%E6%95%B0%E3%82%92%E5%88%A9%E7%94%A8%E3%81%99%E3%82%8B%E3%81%AB%E3%81%AF%EF%BC%88arraylist%E7%B7%A8%EF%BC%89/>

また，IntListやFloatList，StringListを使わず，ArrayListを使いたいとき， `ArrayList<String>` は正常に動きますが， `ArrayList<int>` や `ArrayList<float>` は動きません．

これは，Stringが参照型であり，intやfloatはプリミティブ型であるという，ちょっと難しい話になります．

プリミティブ型をArrayListを使うとき，上からclassでラップした，ラッパークラスを用いることで可能です．

|型|ラッパークラス|
|:-:|:-:|
|boolean|Boolean|
|char|Character|
|int|Integer|
|float|Float|
