# ご質問・ご意見への回答
---

[ご質問またはご意見]

問題を解く時間が足りなく、回答中に解説が始まることが2回に1回くらいあるので、時間に余裕があれば、息抜きもかねて回答時間を1分から1分半にしてほしい

[回答]

残り時間も考慮しつつ検討したいと思います。  
コードの記述量が多いときは多めに時間を取るようにいたします。

---

[ご質問またはご意見]

実習３で、CHRとPOS、N_REFとN_ALTは連続しているため、「df.loc[:, ["CHR":"POS", "N_REF":"N_ALT"]]」としたらエラーが表示されました。この実習３の場合は、４つの列のうち連続した列の組が２つあったとしても、別々に書かないといけないのか、疑問に思いました。

[回答]

残念ながら、列名を指定するリストの中に、コロン(`:`)を使った範囲指定を記述することはできないです。

---

[ご質問またはご意見]

pythonで[]を使うときと（）を使うときの違いがわかりません。

[回答]

おおよそ次のように使い分けします。
- 列名や行名（インデックス）、スライス、抽出する行の条件文を指定するときは、角カッコ`[]`を使います。また、リストを作るときも角カッコ`[]`を使います。
- その他のpandas機能や関数には、丸カッコ`()`を使います。

---

[ご質問またはご意見]

上の方で定義されたのは、新しいコードを追加するときに定義にしなくてもいいですか？  
　ex) 課題5の問題２で定義された nalt_dfを問題3でまた書く必要がないか？

[回答]

一度コードセルで定義した変数は、おなじノートブック上の別のコードセルにも引き継がれます。そのため、問題２で`nalt_df`を定義した場合、問題3で再度定義せずに`nalt_df`を使用できます。

---

[ご質問またはご意見]

実習1で解答例と同じようにコードを書き込んだところ

module "pandas" has no attribute "read"　

というエラーメッセージが出てしまいました。この場合はどう対処するのが良いでしょうか？

[回答]

pandasの`read_csv()`を使う際、正しく`read_csv`と書かれているでしょうか？

`read`だけや`read.csv`、`read csv`となっている場合、お寄せいただいたのと同じエラーが出力されます。

---

[ご質問またはご意見]

スペースの必要な場合とそうでない場合の区別が良く分かりません。

[回答]

スペースをなくしてしまうと、別の関数やデータ、意味をもたないコードとして認識される場合には、スペースが必要です。
```python
# for構文の書き出しとして認識される
for i in "abc":
# 変数`fori`として認識される
# (このコードは構文上のエラーが発生します)
fori in "abc":
```

逆に、Pythonのルール上、スペースをなくしてもコードとしての役割が変わることがない場合、スペースをつける必要はありません。
例えば、イコール記号`=`や演算子`+`、丸括弧`(`や`)`などを含める変数名は禁止されているため、次のコードは、スペースなしでも正しく認識されます。（※ スペースを付けても問題ありません。）
```python
a=123
b=455
c=a+b
print(c)
```

ただ、上の丸括弧`()`には少し注意が必要です。`print`と括弧`()`の間にスペースがあると`print`が関数として扱われなくなります。変数`print`として扱われるようになります。
```python
# print関数として認識される
print(c)
# printが変数として認識される
print (c)
```

---

[ご質問またはご意見]

パイソンでのコピー＆ペーストができなくなってしまったのですが、何か解決法はありますか？インターネットで調べた方法をいろいろ試してみたのですが、どれも効果がありませんでした。

[回答]

キーボードのショートカットキーでもダメでしょうか？
- `Ctrl` + `C`（コピー）
- `Ctrl` + `V`（ペースト）

どうしても直らない場合、以下も試してみてください。
- ブラウザ（Google ChromeやFireFoxなど）の再起動
- パソコンの再起動
- ブラウザの再インストール