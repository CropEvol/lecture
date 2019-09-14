# パス（PATH）

## パスとは
　フォルダやファイルは、パソコンの中で階層的に管理されています。フォルダやファイルの場所情報のことを **パス（PATH）** といいます。

<img src="https://github.com/CropEvol/lecture/blob/master/textbook_2019/images/file_path.png?raw=true" alt="file_path" height="250px">


## 絶対パスと相対パス
　パスには2通りの表し方があります。  

　最上位の階層（**ルート**）から見た位置のことを **絶対パス** といい、次のように表現されます。日本国内の住所で言えば、「京都府向日市物集女町中条1番地」（私たちの研究室の住所）のように表されるのと同じです。

```
/content/sample_data/california_housing_test.csv
```

　また、別の表し方として、**相対パス** といわれるものもあります。これは、任意のファイルからみた位置関係です。先ほどと同じように住所の例で言えば、「となりの市、向日市の物集女町中条1番地」（京都大学メインキャンパスから見た私たちの研究室の場所）といった感じです。

```
A) bootフォルダから見た california_housing_test.csv の位置
　　一番左のピリオド2つ+スラッシュ（../）は「ひとつ上の階層」（つまり、ルート）の意味

../content/sample_data/california_housing_test.csv

B) 同じフォルダにある mnist_test.csv から見た california_housing_test.csv の位置
　　一番左のピリオド+スラッシュ（./）は「同じ階層」（つまり、sample_dataフォルダ）の意味

./california_housing_test.csv
 または
california_housing_test.csv


C) sample_dataフォルダから見た california_housing_test.csv の位置
　　この場合、一番左のピリオド+スラッシュ（./）は「自分自身」（つまり、sample_dataフォルダ）の意味
　　B)と同じ表し方

./california_housing_test.csv
 または
california_housing_test.csv
```

## Google Colaboratoryノートブックはどこで動作しているか
　上の画像の階層構造には表示されていませんが、contentフォルダの元でノートブック（Pythonプログラム）は動いているようです。もし、california_housing_test.csv を読み込んで解析するプログラムを動かす場合、読み込むファイルを指示するコードには次のようなパスを書く必要があります。

```
/content/sample_data/california_housing_test.csv
 または
./sample_data/california_housing_test.csv
 または
sample_data/california_housing_test.csv
```
