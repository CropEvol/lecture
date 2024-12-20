# ご質問・ご意見への回答
---

[ご質問またはご意見]

授業の他でプログラミングや機械学習、ベイズ統計について学ぶためのコンテンツ等があれば教えて欲しい。

[回答]

- Pythonプログラミング
	- Pythonと実データで遊んで学ぶ データ分析講座 / 梅津雄一、中野貴広 / シーアンドアール研究所
		- Pythonと機械学習の入門にはほどよい内容
- ベイズ統計
	- 道具としてのベイズ統計 / 涌井良幸 / 日本実業出版社
		- ベイズ統計の概要を掴むのにちょうど良い
	- **[良書]** Bayesian Methods for Hackers / Cameron Davidson-Pilon / Addison-Wesley Professional
		- オンラインでも読める [[Link](https://camdavidsonpilon.github.io/Probabilistic-Programming-and-Bayesian-Methods-for-Hackers/)]
		- Pythonプログラムでベイズ統計を学べる。ただし、PyMC3やTheanoというPythonライブラリに慣れる必要がある。
		- 和訳書籍あり

- 機械学習 (Machine Learning)
	- **[良書]** The Hundred-Page Machine Learning Book / Andriy Burkov
		- 本のタイトルどおり100ページ（と数ページ）なので、Machine Learningを網羅的に勉強するのに良い。
		- オンラインでも読める [[Link](http://themlbook.com/)]: "read first, buy later"のところからオンライン版を読める。
		- 和訳書籍あり
	- **[良書]** Python Machine Learning: Machine Learning and Deep Learning with Python, scikit-learn, and TensorFlow 2, 3rd Edition / Sebastian Raschka / Packt Publishing
		- Pythonコードもあり、Machine Learningの概要と数学的な背景、機械学習プログラミングをバランスよく学べる。ただし、Chapter 2のコードはやや難しいので、そのコードを理解することに拘らないほうがよい
		- 和訳書籍あり
	- 機械学習のエッセンス -実装しながら学ぶPython,数学,アルゴリズム- / 加藤公一 / SBクリエイティブ
	- Cousera - Machine Learning (Andrew Ng, Stanford University) [[Link](https://ja.coursera.org/learn/machine-learning)]
	- **[良書]** ゼロから作るDeep Learning ―Pythonで学ぶディープラーニングの理論と実装 / 斎藤康毅 / オライリージャパン
		- ニューラルネットワークをライブラリを使わずに作る本。Deep Learningの仕組みがよくわかる。
		- この続編も出ている

---

[ご質問またはご意見]

ディープラーニングのニューロンネットワークのニューロンはヒトのニューロンに倣ったものだと教わりましたが、マシンは情報とその情報に含まれる精確的な意味を同時に入力して学習させる（数字識別の場合は数字の画像とそのラベルを同時に入力する）必要がありますが、ヒトの場合は最初入力された情報はどんな意味かわからなくても学習を続ければ、似ているような情報を入力すればその意味がわかるようになる（たとえば、英語の音声は最初聞いて全然分からなくても聴き続ければ、話の意味がわかるようになることがある）という違いはなぜ存在するのでしょうか。

[回答]

※ 脳科学者ではありませんので、以下の回答が正しいかどうかはわかりません。勝手な想像です。もし正確な回答をお持ちの方がおられましたら、お教えください。


　新しい情報（入力データ）が既存の知識のどれに近いか分類し、新しい情報に何らかの意味付け（定義付け）をおこなっているのかもしれません。これは、機械学習では、「予測」と言われる工程です。  
正解ラベルがない手書き数字の写真を与えた時、0~9のどれに近いかを予測することが可能です。  
ヒトは、その「予測」により、新しい情報に仮の正解ラベルを付ける"学習"をおこなっていると思います。

　また、正解ラベルを使った「学習」もおこない、定義付けられた既知の情報を日々修正しているでしょう。  
"新しい情報"そのものではなくても、それに近い情報であれば定義の更新がおこなわれるでしょう。

　ヒトは、正解ラベルがない「予測」と正解ラベルを使った「学習」をおこない、  
(1)新しい情報に仮に定義づけをし、  
(2)情報に紐づいた定義の微調整し、  
新しい情報をより正しく（一般的に）に理解できるようになっていくのではないでしょうか。

　なお、上述の「学習」と「予測」は、どちらも機械学習・ディープラーニングが模倣している部分です。

---

[ご質問またはご意見]

期末試験は実施するのですか。

[回答]

シラバスどおりを予定しています。  
期末試験ではなく、期末レポートが出題される予定です。

---

[ご質問またはご意見]

本講義は録画配信されないのでしょうか？接続が悪いときがあるので、録画配信して頂けると幸いです。

[回答]

講義の録画配信は予定していません。

学内の講義室は開放いるようです。適宜ご利用ください。ただし、マスク等着用し、感染対策をおこなった上でご利用ください。

---
