# 配列（Array）

## 1. 配列の作成

コード : [Array1.pde](../Code_Array/Array1/Array1.pde)

配列は大きさが決まった（変更できない），値の集まりです．

配列は以下のように作成することができます．

```java
// 100個のint型の配列
int[] numbers;
numbers = new int[100];

// おみくじの配列
String[] omikuji = { "大吉", "中吉", "小吉" };
```

変数を宣言する時，

```java
型[] 変数名

int[] numbers;
```

とします．

また変数を宣言した時点では，配列はまだ変数に入っておらず，配列を作成し代入しなければなりません．

作成するには，

```java
new 型[数]

new int[100]
```

とします．

また，おみくじの配列のように，

```java
{ 要素0, 要素1, 要素2, ... }

{ "大吉", "中吉", "小吉" }
```

と配列に入れる値を書き，配列を作ることもできます．

## 2. 配列の操作

コード : [Array2.pde](../Code_Array/Array2/Array2.pde)

配列へアクセスは（配列の中の値を取得は），以下のようにできます．

```java
// 表示する
println("omikuji[0] = " + omikuji[0]);

// 範囲外を表示する
println("omikuji[10] = " + omikuji[10]);

// 値を変更する
omikuji[0] = "超大吉";

// 全て表示する
for (int i = 0; i < omikuji.length; i++)
{
  println("omikuji[" + i + "] = " + omikuji[i]);
}
```

配列へアクセスするには，

```java
配列[添え字]

omikuji[0]
```

とします．

添え字は 0 ~ 配列の大きさ - 1 です．

このとき，大きさが3の配列 omikuji に

```java
omikuji[10]
```

のように「配列の大きさ以上の添え字を与える」もしくは「負の添え字を与える」と，

```
ArrayIndexOutOfBoundsException: 10
```

と赤くエラーが発生します．

配列の要素を変更するには，

```java
配列[添え字] = ...

omikuji[0] = "超大吉";
```

とします．

配列の中を全て表示するには，

```java
for (int i = 0; i < omikuji.length; i++)
{
  println("omikuji[" + i + "] = " + omikuji[i]);
}
```

とすると楽です．

```java
配列.length

omikuji.length
```

は，配列の大きさを取得することができるものです．

これを用いることで，omikujiが変更され，配列の大きさが変わった場合も同じコードを使うことができます．

## 3. その他

コード : [Array3.pde](../Code_Array/Array3/Array3.pde)

foreach文というものを用いることでも，配列の中を全て表示することができます．

```java
for (型 変数 : 配列)
{
    ...
}

for (String text : omikuji)
{
  println("text = " + text);
}
```

作成した配列が代入されていない場合，

```java
float[] numbers2;
println("numbers2[0] = " + numbers2[0]);
```

初期化されていない（何も代入されていない）というエラー

```
The local variable numbers2 may not have been initialized
```

が発生したり，

何もない（作成された配列が代入されていない）というエラー

```
NullPointerException
```

が発生します．

この2つは，

```java
if (numbers2 == null)
{
  println("numbers2 is null");
}
```

というように`null`かどうか判定することで，分かります．

逆説的に，`null`を代入することで，何もない変数にすることができます．

```java
number = null;
```

## 余談

配列は大きさを0で作成することができます．

このとき，大きさが0の配列とnullの配列は，まったく異なります．
