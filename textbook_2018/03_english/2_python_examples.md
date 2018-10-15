
- - - - - - - - - - - - -
### <div style="text-align: center;"> Python Programming Examples </div>
-------------------------
Please type these examples to check how they work.

###### Example 1
```python
print("Hello world!")
```
+  ```print``` can **show the data on your screen**.
+ A data of inside ```()``` is referred to as **argument**.

###### Example 2
```python
greeting = "Hello world!"
print(greeting)
```
+ **Variable** is the data which don't have ```""```.
+ ```=``` can assign a right-side data to reft-side variable

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
+ ```+``` is **plus**.
+ ```-``` is **minus**.
+ ```*``` is **times**.
+ ```/``` is **division**.
+ ```%``` is **remnant**。
+ ```**``` is **power**.
+ The result of ```a``` is different from that of ```g``` because Python can distinguish numbers from characters with their **data type**. You can check data type by ```print(type(data))```

###### Example 4
```python
for n in range(10):
    print("inside")
print("outside")
```
+ The number of inside ```range()``` shows the number of **iteration (looping)**.
+ The left-side of ```print``` is referred to as **indent**. Indent can be inserted by **tab-key**.
+ Program outside of paragraph is not worked in iteration.

###### Example 5
```python
x = 10
for n in range(x):
    print(n)
print(n)
```
+ You have to declare the variable before you use it, but it is ok in this case. ```n``` will change their data with iteration.
+ For example, in the case of ```range(10)```, ```n``` starts from 0 and ends at 9 within 10 times.

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
+ ```if``` and  ```elif``` show **branching**. If the equation after these words is TRUE, the next paragraph can work.
+ If no data satisfy the equation after ```if``` and ```elif```, the paragraph after ```else``` will work.
+ ```==``` shows equality instead of ```=``` because ```=``` already shows assignment.

###### Example 7
```python
numbers = [1,2,3,4,5,6,7,8,9]

print(numbers[0])
print(numbers[3])
print(numbers[3:5])
```
+ Data sandwiched by ```[]``` shows **list**, which can contain data more than one.
+ ```numbers[0]``` extracts the first element from list because python counts first position as position **zero**.
+ ```numbers[3]``` extracts the forth element from list.
+ ```numbers[3:5]``` slices list from forth to fifth element.

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
+ ```def``` defines your own **function** like ```print```; for example ```add```.
+ If you want to assign the result from function to variable outside of its function, please use ```return```.

###### Example 9
```python
def multi_three(numbers):
    for n in numbers:
        if n%3 == 0: # if n can be devided by 3
            print(n, "is a multiple of 3.")

multi_three([3,4,5,6])
```
+ **Comments** can be inserted at the right-side of ```#```.
+ Not only ```range()``` but also list can be used as itaration. Then, element from first to last is assigned to ```n``` one-by-by.

###### Example 10
Now examples are getting practical.
For example, you want to count the base "A" in a sequence.That script is like below:
```python
def count_A(seq):
    a = 0
    for nuc in seq:
        if nuc == "A": # if nuc is A
            a = a + 1
    print("A : ", a)

count_A("ATGCTATAGCATGTGA")
```
+ Characters can be used as iteration like list. Then, each element is each character.  
+ ```a = a + 1``` plus 1 to ```a``` itself. Then, ```a``` is called **counter**.

###### Example 11
Next, you want to count the difference between two sequences. That script is like below:
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
+ By using ```zip```, more than one lists or characters can be iterated simultaneously.
+ When two data are different,  ```!=``` returns TRUE. That is, the next paragraph will work.

###### Example 12
For example, you are a researcher for human recessive gene which causes serious disease. Now, a progeny is affected by that disease. Then, you want to check progeny's genotype from his parental sequences. 0 shows ancestral allele and 1 shows mutated allele, so his causal genotype must be the homozygote of 1. These genotypes could be searched like below:
```python
def genotype(seq1, seq2):
    progeny = [] # empty list
    for nuc1, nuc2 in zip(seq1, seq2):
        gt = nuc1 + nuc2 # genotype (0/0, 0/1, 1/1) -> (0, 1, 2)
        progeny.append(gt)
    return progeny

from_mother = [0,0,0,1,0,1,1,0] # mother's chromosome
from_father = [0,1,0,1,0,0,0,0] # father's chromosome

progeny = genotype(from_mother, from_father)
print(progeny)
```
+ ```append``` can append the new element, which is inside of ```()```, to a list, which is left-side of ```.```.

###### Example 13 ( ! )
```python
import numpy as np

from_mother = np.array([0,0,0,1,0,1,1,0])
from_father = np.array([0,1,0,1,0,0,0,0])

progeny = from_mother + from_father
print(progeny)
```
+ Using ```import```, you can use the function made by other people. **Modules** like ```numpy``` include many functions.
+ You can set the abbreviation of module by ```as```. After that numpy can be called as ```np```.
