
- - - - - - - - - - - - -
### <div style="text-align: center;"> Python exercise </div>
-------------------------

Following equations are the statistics for population genetics. Please make the program to calculate these statistics. What these statistics calculate will be explained with your own program in later class.

#### Exercise 1
Do you know Watterson's *θ*? This shows the expected nucleotide diversity with the number of segregating sites.  Watterson's *θ* is calculated like below:

$$ \theta_{W} = \frac{S}{a} $$

, where $a$ is

$$ a = \sum_{i=1}^{n-1}\frac{1}{i} $$

Watterson's *θ* needs $S$（the nubmer of segregating sites, or the number of mutation sites）and $n$ (the number of sequence, or the nubmer of chromosomes). Note that $W$ is not multiplication but subscript. Please make the program to calculate Watterson's *θ*.

```python
# Hints for programming!
def watterson_theta(S, n):
    a = 0
    for i in range(n-1):
        a = a + 1/(i+1)
        :
        :
    return theta

theta = watterson_theta(4, 5)
print(theta) # 1.92
```

#### Exercise 2
Now, do you know how to calculate nucleotide diversity ($\pi$)?
<font face="Osaka">
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　（seq０） A T G C A T G
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　（seq１） A T C C A C C
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　（seq２） G A G T A T C
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　（seq３） G T G C A T C
　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　（seq４） G T G T A C C

Number of sites same to seq０　　　　　　　　　　　　　　　2 4 4 3 5 3 1
Number of sites different from seq０　　　　　3 1 1 2 0 2 4
→multiply upper and bottom-side　　　　　　　　　6 4 4 6 0 6 4
</font>
Please look at above figure. $\pi$ can be calculated in following process.
1. Set reference sequence. Now we set seq0 as reference.
2. In each sites, count both the number of sites same to reference (including reference) and the number of sites different from reference.
3. In each sites, multiply them (that is, the number of same and difference sites)
4. The numerator of $\pi$ is the sum of these multiplication like below:
$$ \pi=\frac{6+4+4+6+0+6+4}{n(n-1)/2} $$

5. *n* is the number of sequences (the nubmer of chromosomes). Now $n$ is 5. So,
$$ \pi=\frac{6+4+4+6+0+6+4}{5(5-1)/2}=3 $$

Now, we know both the number of sites same to reference and the number of sites different from reference, and it is given as the type of list. Please make the program to calculate $\pi$. Note that this program has two arguments (the type of list) like below. In addition, note that ```(6+4+4+6+0+6+4)/(5*(5-1)/2)``` and ```6+4+4+6+0+6+4/5*(5-1)/2``` show different answers (previous one is correct now).

```python
# Hints for programming!
def diversity(ref, alt):
    nume = 0 # numerator
    for ref_n, alt_n in zip(ref, alt):
        nume = nume + ref_n*alt_n
    n = ref[0] + alt[0]
        :
        :
    return pi

ref = [2,4,4,3,5,3,1] # the list of numbers same to reference
alt = [3,1,1,2,0,2,4] # the list of numbers different from reference

pi = diversity(ref, alt)
print(pi) # 3.0
```

#### Exercise 3
$F_{ST}$ is the statistics to calculate the distance between two populations. Actually, there so many way to calculate $F_{ST}$. Now we adopt Nei's $F_{ST}$. This is simple, intuitive and less biased estimator for $F_{ST}$. it can be calculated like below:

$$ F_{ST} = \frac{\pi_{12}-(\pi_{1}+\pi_{2})/2}{\pi_{12}} $$

$\pi$ in above equation is same to $\pi$ which is calculated in Exercise2. Now, $\pi_{1}$ is $\pi$ in population 1, and $\pi_{2}$ is $\pi$ in population 2. We will assume that these populations are
come from the same (united) population. For example,

```python
ref1 = [2,4,5] # the number of same sites in population 1
alt1 = [3,1,0] # the number of different sites in population 1

ref2 = [2,1,0] # the number of same sites in population 2
alt2 = [3,4,5] # the number of different sites in population 2
```
then, united population is like below:
```python
ref12 = [4,5,5] # sum of ref1 and ref2
alt12 = [6,5,5] # sum of alt1 and alt2
```
That united population is $\pi_{12}$.
Please make the program to calculate $F_{ST}$. Note that it is assumed that the same reference sequence is used in population 1 and population 2.

```python
# Hints for programming!
def diversity(ref, alt):
    :
    :
    return pi

def nei_fst(ref1, alt1, ref2, alt2):
    ref12 = []
    for ref_n1, ref_n2 in zip(ref1, ref2):
        ref12.append(ref_n1+ref_n2)
        :
    pi1 = diversity(ref1, alt1)
        :
    return fst

ref1 = [2,4,4,3,5,3,1] # the number of same sites in population 1
alt1 = [3,1,1,2,0,2,4] # the number of different sites in population 1

ref2 = [2,1,1,3,0,3,3] # the number of same sites in population 2
alt2 = [3,4,4,2,5,2,2] # the number of different sites in population 2

fst = nei_fst(ref1, alt1, ref2, alt2)
print(fst) # 0.184...
```
