
**（学科）**　　　　　　　　**（学籍番号）**　　　　　　　　**（名前）**
- - - - - - - - - - - - -
### <div style="text-align: center;"> Python プログラミング例 </div>
-------------------------

###### Example 1
```python
print("Hello world!")
```
+  ```print```は(　　　　　　　　)できる。
+ ```()```の中のデータのことを(　　　　)という。( ! )

###### Example 2
```python
greeting = "Hello world!"
print(greeting)
```
+ ```""```がないものは(　　　)として扱う。( ! )
+ ```=```は右側のデータを左側へ(　　　)できる。( ! )

###### Example 3
```python
a = 3+2
b = 3-2
c = 3*2
d = 3/2
e = 3%2
f = 3**2
g = "3"+"2"

print("a : ", a)
print("b : ", b)
print("c : ", c)
print("d : ", d)
print("e : ", e)
print("f : ", f)
print("g : ", g)
```
+ ```+```は(　　　　)。
+ ```-```は(　　　　)。
+ ```*```は(　　　　)。
+ ```/```は(　　　　)。
+ ```%```は(　　　　)。
+ ```**```は(　　　　)。
+ ```a```と```g```の結果が異なるのはpythonが(　　　　)と(　　　　)を区別しているから。

###### Example 4
```python
for n in range(10):
    print("inside")
print("outside")
```
+ ```range```の```()```の中の数字は(　　　　　　　)を表している。
+ ```print```の手前のくぼみのことを(　　　　　　　)と言い、tabキーを１回押すことで作ることができる。( ! )
+ 段落の外は(　　　　　　　　　)。

###### Example 5
```python
x = 10
for n in range(x):
    print(n)
print(n)
```
+ ```n```の中の数字は(　　　　　　　)から始り(　　　　　　　)で終わる。

###### Example 6
```python
for n in range(10):
    if n < 5:
        print(n, "is less than 5")
    elif n == 5:
        print(n, "is equal to 5")
    else:
        print(n, "is more than 5")
```
+ ```if```や```elif```の後の条件式が真であれば(　　　　　　　　　　　　)が行われる。
+ ```if```や```elif```の後のどの条件式にも当てはまらなければ(　　　)のプログラムが行われる。
+ 等しいことは```=```ではなく(　　　)で表現される。

###### Example 7
```python
numbers = [1,2,3,4,5,6,7,8,9]

print(numbers[0])
print(numbers[3])
print(numbers[3:5])
```
+ ```[]```で囲まれたデータのことを(　　　)という。( ! )
+ ```numbers[0]```は(　　　)番目の要素を表している。
+ ```numbers[3]```は(　　　)番目の要素を表している。
+ ```numbers[3:5]```は(　　　)番目から(　　　)番目の要素を抜き出している。

###### Example 8
```python
def add(a, b):
    c = a + b
    return c

x = add(1, 2)
y = add(3, 5)

print("x is", x)
print("y is", y)
```
+ ```def```の後に設定した名前で、段落内の機能を持った自作の(　　　)を作った。( ! )
+ ```return```は(　　　　　　　　　　　　　　　　　　　)。

###### Example 9
```python
def multi_three(numbers):
    for n in numbers:
        if n%3 == 0: # nを3で割った余りが0ならば
            print(n, "is a multiple of 3.")

multi_three([3,4,5,6])
```
+ ```#```は(　　　　　　　　　)と言ってプログラムから(　　　　　)される。 ( ! )
+ ```in```の後にあるリストは、(　　　)から(　　　)までの要素が順番に```n```へと代入される。

###### Example 10
```python
def count_A(seq):
    a = 0
    for nuc in seq:
        if nuc == "A": # nucがもしAならば
            a = a + 1
    print("A : ", a)

count_A("ATGCTATAGCATGTGA")
```
+ ```in```の後にある文字列は、(　　　)から(　　　)までの文字が順番に```nuc```へと代入される。
+ ```a = a + 1```は```a```に(　　　　　　　　　　　　)ている。

###### Example 11
```python
def compare_seqs(seq1, seq2):
    S = 0
    for nuc1, nuc2 in zip(seq1, seq2):
        if nuc1 != nuc2:
            S = S + 1
    print(i, "sites are different.")

seq1 = "ATGCTATAGCATGTGA"
seq2 = "ATGCGATAACATGTCA"
compare_seqs(seq1, seq2)
```
+ ```zip```は同じ長さの文字列、またはリストの要素を(　　　　　　　　　　　　)。
+ ```!=```は２つデータが(　　　　　　)時に真となる。

###### Example 12
```python
def genotype(seq1, seq2):
    progeny = [] # 空のリストを作成
    for nuc1, nuc2 in zip(seq1, seq2):
        gt = nuc1 + nuc2 # genotype (0/0, 0/1, 1/1) -> (0, 1, 2)
        progeny.append(gt)
    return progeny

from_mother = [0,0,0,1,0,1,1,0]
from_father = [0,1,0,1,0,0,0,0]

progeny = genotype(from_mother, from_father)
print(progeny)
```
+ ```append```は```.```の左にある名前のリストへ```()```の中にある要素を(　　　　)という機能を持つ。

###### Example 13 ( ! )
```python
import numpy as np

from_mother = np.array([0,0,0,1,0,1,1,0])
from_father = np.array([0,1,0,1,0,0,0,0])

progeny = from_mother + from_father
print(progeny)
```
+ ```import```することで他人の作った(　　　　　　　　　)を使うことができる。( ! )
+ ```as```は、そのモデュールを、それ以降、```np```と略して使うことを指定している。
