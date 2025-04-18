<img src="https://github.com/CropEvol/lecture/blob/master/textbook_2022/images/logo.png?raw=true" alt="2022年度ゲノム情報解析入門" height="100px" align="middle">

<div align="right"><a href="https://github.com/CropEvol/lecture#section2">実習表ページに戻る</a></div>

# 講義へのご意見・ご質問

● バルクシーケンシングを行った際に全体が赤くなったリードが2，3箇所見られたのですが、これは何を表しているのでしょうか？
● IGVで赤く表示されるリードがあるのはなぜでしょうか。

<img src="https://github.com/CropEvol/lecture/blob/master/textbook_2022/images/igv_redcolored_reads.png?raw=true" alt="IGV red-colored reads" height="200px" align="middle">

> 2つのペアエンドリードの間の距離（"insert"と呼ばれる部分）がIGVの設定値よりも長い場合に赤色で表示されるようです。  
> 詳細: https://software.broadinstitute.org/software/igv/interpreting_insert_size 
>  
> 次世代シーケンシングは、さまざまな長さのDNA断片の両端をシーケンシングします。そのため、IGVのデフォルト設定値よりも長いinsertのペアエンドリードが得られることも多々あります。

---

● 原因変異の可能性がある固定SNPを調べる時、アライメントした全てのリードが同じSNPを持っている時はもちろんそのSNPが原因変異の可能性があると考えられるが、リードの内8割～9割のリードが同じSNPを持っている場合、それは原因変異の可能性があるとみなすことが出来るのでしょうか？また、原因変異の可能性があるとみなすことができる割合の境界線などがあったりするのでしょうか？

> 今回、簡易的なサンプルデータでおこなったため、固定SNPを探すことで原因変異を特定するということができました。  
> しかし、実際のQTL-seqでは、技術的に、また、生物学的な理由で、「固定SNP＝原因変異」と判断することはできません。  
> - 技術的な理由1) ゲノム上のすべてのSNPを必ず検出できるわけではありません。実際にQTL-seqをおこなうと、多数のリードを読めるゲノム領域もあれば、全くリードが得られない領域も出てきます。未検出SNPの中に原因変異がある可能性があります。  
> - 技術的な理由2) 多くのSNPを調べるため、偶然に両方のバルクで固定SNPが得られることがあります。バルク中のリードのサンプリングは基本ランダムにおこなわれます。多数のSNP座を扱うと、偶然に両バルクで対立するような固定SNP（偽陽性の固定SNP）が得られることがあります。  
> - 生物学的な理由3) とくに量的な形質の場合、形質の違いに複数の遺伝子が関わっていることがあります。そのような場合、原因変異のSNPアリル構成は固定SNPではないかもしれません。  
> 
> つぎに、原因変異の可能性があるかどうかの境界線についてです。厳密な境界線があるわけではありませんが、設定できます（実際の解析では何らかの境界線を設定します）。そのSNP構成が得られる確率をシミュレーションで求め、「1%や5%の確率でしか得られないSNP構成」であれば原因変異の可能性があるといった境界線を決めたりします。
> 
> なお、実際のQTL-seqは、原因変異をピンポイントで特定することが難しいことがほとんどのため、原因変異を特定するのではなく、原因変異がありそうな場所（ゲノムの範囲）を特定するために用いられます。その原因変異がありそうな場所は、「1%や5%の確率でしか得られないSNP構成」が多く集まっている場所として検出します。


---

● 全ゲノムシーケンシング（Whole genome sequencing: WGS)とロングリードシーケンシング（Long-read sequencing）がどちらも全ゲノムが対象のシーケンスだと思うのですが、違いがよく分かりませんでした。両者にそれぞれ長所・短所があるのでしょうか。  

> 両者を比較したときの長所と短所は以下のとおりです。
> 
> 全ゲノムシーケンシング（Whole genome sequencing: WGS):
> - 長所: 1回のシーケンシングで、多量のリードを得られる（出力リードの合計塩基数: 100Gb程度〜）
> - 長所: 得られるリードのクオリティが高い
> - 短所: 配列が短い（150kb〜300bp）
> 
> ロングリードシーケンシング（Long-read sequencing）:
> - 短所: 1回のシーケンシングで、得られるリード量が少ない（出力リードの合計塩基数: 〜15Gb程度）
> - 長所: リードのクオリティが低い
> - 長所: 長い配列を得られる（数百〜数Mb）

---

● 前回の課題の第一問（重複配列が含まれるアセンブルの問題）について模範解答よりリード長を長く、リード量を少なくしてもアセンブルできたのだが、リードが長いとエラーが起きやすいためまずはできるだけ短くすべきという捉え方で良いのだろうか。

> 前回の課題については、長いリードが反復配列を含むゲノムアセンブルに役立つことを理解してもらうのが主な目的でしたので、いきなり長いリードを多量に試してもらっても構いません。。  
> エラーの少ない長いリードを多数得られるのであれば、それらの長いリードでアセンブルするのが一番です。  
> 
> 実際のゲノムシーケンシングでは、ロングリードシーケンシングは塩基の読み間違い（エラー）を多く含みます。エラーの多いロングリードだけでゲノムアセンブルできたとしても、信頼性が低く、役立つゲノム配列にはなりません。信頼性の高いゲノム配列を得るためには、お互いのエラーを補えるだけのリード量が必要です。  
> 一方で、ショートリードのほうは、課題のように自由にリードの長さを選べるわけではありませんが、高い信頼性をもつ150bpや300bpのリードを多量に得られます（現在では、ショートリードシーケンシングで、ロングリードシーケンシングの約20倍以上の配列情報を得られます）。しかし、ショートリードだけでコンティグと呼ばれる数百〜数Mb程度の配列を得ることはできますが、染色体レベルのアセンブルはできません。  
> 
> 現在、ゲノムアセンブルで主流な方法は、ショートリードとロングリードを組み合わせる手法です。「ロングリードの配列を不正確をショートリードで補正し、補正後のロングリードを繋ぎ合わせて、染色体レベルの配列を目指す」方法が多く採られています。
