# リスト（List）

## 1. リストの作成

コード : [List1.pde](../Code_List/List1/List1.pde)

リストは大きさを自由に決められる値の集まりです．

リストは以下のように作成することができます．

```java
// int型のリスト
IntList list;
list = new IntList();

// float型のリスト
FloatList floatList = new FloatList();

// String型のリスト（おみくじの配列）
StringList omikuji = new StringList();
```

変数を宣言する時，int用，float用，String用それぞれ

```java
IntList 変数名
FloatList 変数名
StringList 変数名
```

とします．

また変数を宣言した時点では，リストはまだ変数に入っておらず，リストを作成し代入しなければなりません．

作成するには，

```java
new IntList()
new FloatList()
new StringList()
```

とします．

## 2. リストの操作

コード : [List2.pde](../Code_List/List2/List2.pde)

リストを作成した時点では，まだ中身が空であり，値を追加してあげる必要があります．

追加するには，

```java
リスト.append(値)

omikuji.push("大吉");
```

とします．これにより値が最後尾に追加されます．

リストへアクセスするには，

```java
リスト.get(添え字)

omikuji.get(0)
```

とします．

添え字は 0 ~ リストの大きさ - 1 です．

このとき，大きさが3のリスト omikuji に

```java
omikuji.get(10)
```

のように「リストの大きさ以上の添え字を与える」もしくは「負の添え字を与える」と，

```
ArrayIndexOutOfBoundsException: Array index out of range: 10
```

と赤くエラーが発生します．

リストの要素を変更するには，

```java
リスト.set(添え字, 値)

omikuji.set(0, "超大吉");
```

とします．

リストの要素を削除するには，

```java
リスト.remove(添え字)

omikuji.remove(1);
```

とします．

この添え字より後にある要素は，自動的に前に詰められて，添え字が変更するので注意してください．

リストの中を全て表示するには，

```java
for (int i = 0; i < omikuji.size(); i++)
{
  println("omikuji.get(" + i + ") = " + omikuji.get(i));
}
```

とすると楽です．

```java
リスト.size()

omikuji.size()
```

は，リストの大きさを取得することができるものです．

これを用いることで， omikuji が変更され，リストの大きさが変わった場合も同じコードを使うことができます．

## 3. その他

コード : [List3.pde](../Code_List/List3/List3.pde)

配列と同様にforeach文というものを用いることでも，リストの中を全て表示することができます．

```java
for (型 変数 : リスト)
{
    ...
}

for (String text : omikuji)
{
  println("text = " + text);
}
```
