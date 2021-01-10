# ご質問・ご意見への回答
---

[ご質問またはご意見]

プログラミングでよくみるimport osの意味を教えてください。

[回答]

　`import os`は、pandas,numpy,matplotlibなどと同じように、「os」と呼ばれる追加機能を呼び出すコードです。

　`import os`の「os」は、オペレーティングシステム（Operating System）、すなわち、コンピュータの基本的な機能（ファイルやフォルダを新しく作る・削除する・開く・閉じる、などの機能）を管理しているシステムのことです。

　`import os`でコンピュータの各種基本機能を操作することができるようになります。

```python
# 例
import os

print(os.getcwd())   # 今自分がいる場所（どのフォルダ)にいるのかを表示する
print(os.listdir())  # 現在のフォルダに何があるか調べる

os.chdir('sample_data')  # 「sample_data」フォルダに移動する
print(os.getcwd())
print(os.listdir())

os.mkdir('ABC_folder')  # 新しいフォルダを作成する
print(os.listdir())
```

　上のような操作を、みなさんはグラフィカルユーザインターフェイス（GUI）でおこなっています。
- マウス操作・タッチパネル操作で別のフォルダ内に移動する
- マウス操作・タッチパネル操作で新しいフォルダを作成する　など
