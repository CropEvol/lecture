<img src="https://lh3.googleusercontent.com/pw/AM-JKLVhTn_UySwMdfMwXvoq8l3VN7IkrY9cwtH2YJVMxAlMznUBWC9IpFtgPRIyfAXru4oykkYD-1WjWi0Ao5XgkB9JICvzDBcfn0L_5X2_KOOppsURK5DfSifCC-s7Vx5oQrBUn_BNWn_hfAPdhlVbKQGE=w1097-h235-no?authuser=0" alt="2021年度ゲノム情報解析入門" height="100px" align="middle">

<div align="right"><a href="https://github.com/CropEvol/lecture#section2">実習表ページに戻る</a></div>

# 12月28日の講義へのご意見・ご質問

【質問・感想(一部)】

今回の説明だと、勾配法はかなり有能なように聞こえたが、例えば回帰によってモデルを作成するような場合に、勾配法を用いるデメリットはあるのでしょうか。

> 勾配降下法は解析的に答えが求まらない場合に有効な手法になりますが、学習率や目的関数によってはパラメータの更新を何度も行う必要があり、計算量が多くなる場合があります。例えば線形回帰では基本的に行列を用いた解析的な計算によって答えが求まるので、計算量・計算時間を考えると勾配降下法より速く答えが求まる場合が多いです。

本講義ではPythonが使用されていますが、R, fortranなど統計解析が可能な言語はいくつかあると思います。
どの言語を選択するかに関して、指針等あればご教示いただきたいです。

> 統計解析に関していうと、PythonとRに関してはどちらを使っても問題無いです。一昔前はPythonにしか(/Rにしか)無いライブラリなどもありましたが、今では統計解析や機械学習に関するライブラリやパッケージは基本的にPythonで実装されているものはRでも実装されています。Fortranに関しては、速度が速い言語なのでライブラリやパッケージに依存しない自分独自の解析手法や計算プログラムを開発する際には1つの選択肢になるかもしれません。

生物の系統樹の推定において、発見的探索法（考えられる系統樹から初期値を選び、少しずつ変形して目的とする指数がより良い値になる系統樹に変えていくことにより、最もその指数が良い系統樹（最適解）に到達する方法）を行うと、局所的に指数が最も良い誤った系統樹を推定することがあると聞いたことがありますが、これは機械学習において局所解を導出してしまうことと関連しているのでしょうか？

> 良い着眼点ですね。局所解になってしまうという概念はとても似ています。系統樹は初期値によって到達する系統樹が変わってしまうので、特定の初期値に依存した結果にならない様に(局所解にならない様に)する必要があります。複数の初期値からスタートして複数の系統樹を作成し、それらの結果からもっともらしい系統樹を推定したり、ブートストラップ値という指標を使って系統樹の分岐点の信頼性を確認したりします。

後半になって試行回数を数字を近くなるように導き出したりすることへの理解があまり足りていないので授業終了までに解決します。

> 講義時間だけではコードの内容や理論を全てしっかり詳しくと言う訳にはいかないので、もし講義内容に興味が持てれば、(講義が終わった後でも)自分で調べてみてください。

期末レポートの内容や期限などの詳細について教えてください。

> 後日連絡します。

全然関係ないことで申し訳ないのですが、フリーＷｉ－Ｆｉにモバイルデータ通信のないデバイスから登録する時、その登録フォームのデータはWi-Fi未接続段階で送られてくるはずなのですがそれは何で送信されているのでしょうか？

> (専門では無いので間違っているかもしれないですが)、登録前でもwebページなどに接続できないだけで、自分の端末(スマホやPC)とwi-fiルーター間で通信自体は行えているからではないでしょうか。登録フォーム自体はルーターから送られている可能性があります。