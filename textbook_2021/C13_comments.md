<img src="https://lh3.googleusercontent.com/pw/AM-JKLVhTn_UySwMdfMwXvoq8l3VN7IkrY9cwtH2YJVMxAlMznUBWC9IpFtgPRIyfAXru4oykkYD-1WjWi0Ao5XgkB9JICvzDBcfn0L_5X2_KOOppsURK5DfSifCC-s7Vx5oQrBUn_BNWn_hfAPdhlVbKQGE=w1097-h235-no?authuser=0" alt="2021年度ゲノム情報解析入門" height="100px" align="middle">

<div align="right"><a href="https://github.com/CropEvol/lecture#section2">実習表ページに戻る</a></div>

# 1月11日の講義へのご意見・ご質問

【質問・感想(一部)】

授業期間が終わった後も授業サイトは見られますか？

> 授業サイトは基本的に公開し続ける予定です。
> 今後どこかで使えそうな手法等があれば、また確認しに来てみて下さい。

課題２にてニューラルネットワークを用いて解答しましたが、同じコードでもセルを実行すると評価の値が変化しました。なぜ値が変化するのでしょうか？

> ニューラルネットワーク(NN)に関しては今日の講義で扱いますが、NNの学習に際して、重み等の初期値にランダムな値が用いられています。
> 引数で何も指定しなければ、子の初期値は乱数によって決められるので、毎回学習結果が少しずつ変わることになります。この乱数もrandom_stateという引数で固定することが可能です。
> clf = MLPClassifier(hidden_layer_sizes=(3,3,3,), solver="sgd", learning_rate_init=0.1, max_iter=1000) ではなく、
> clf = MLPClassifier(hidden_layer_sizes=(3,3,3,), solver="sgd", learning_rate_init=0.1, max_iter=1000, random_state=0)
> の様にモデルを設定すると毎回同じ様に学習が進められるので、同じ結果が返ってくるようになります。

サンプルデータのダウンロードでは外部コマンドのwgetを使用しておりますが、なぜ外部コマンドを使用しているのでしょうか。
知識やコードの汎用性を考えると、Pythonで統一したほうが良いような気もしないでもないです。

> 特に理由はありませんでした、たしかにPythonで統一した方が見栄えも良くなりそうな気がします。御意見ありがとうございます。

読んでいたベイズ統計の本でもPyMC3が紹介されておりました。
PyMC3がデファクトスタンダードなのでしょうか。

> ベイズモデリングをする際には、PythonのPyMC3もしくはRのStanパッケージが今の所ポピュラーなライブラリかと思われます。
> 理論的な研究を進めている人達には、Julia等で自分独自でアルゴリズム等実装している人もよくいる印象です。
