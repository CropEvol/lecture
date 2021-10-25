<img src="https://lh3.googleusercontent.com/pw/AM-JKLVhTn_UySwMdfMwXvoq8l3VN7IkrY9cwtH2YJVMxAlMznUBWC9IpFtgPRIyfAXru4oykkYD-1WjWi0Ao5XgkB9JICvzDBcfn0L_5X2_KOOppsURK5DfSifCC-s7Vx5oQrBUn_BNWn_hfAPdhlVbKQGE=w1097-h235-no?authuser=0" alt="2021年度ゲノム情報解析入門" height="100px" align="middle">

<div align="right"><a href="https://github.com/CropEvol/lecture#section2">実習表ページに戻る</a></div>


# Phredクオリティスコアの対応表と正確性について

## Phredクオリティスコアー文字の対応表
|Phredクオリティスコア|対応文字||Phredクオリティスコア|対応文字||Phredクオリティスコア|対応文字|
|:---:|:---:||:---:|:---:||:---:|:---:|
|0|!||32|A||64|a|
|1|"||33|B||65|b|
|2|#||34|C||66|c|
|3|$||35|D||67|d|
|4|%||36|E||68|e|
|5|&||37|F||69|f|
|6|'||38|G||70|g|
|7|(||39|H||71|h|
|8|)||40|I||72|i|
|9|*||41|J||73|j|
|10|+||42|K||74|k|
|11|,||43|L||75|l|
|12|-||44|M||76|m|
|13|.||45|N||77|n|
|14|/||46|O||78|o|
|15|0||47|P||79|p|
|16|1||48|Q||80|q|
|17|2||49|R||81|r|
|18|3||50|S||82|s|
|19|4||51|T||83|t|
|20|5||52|U||84|u|
|21|6||53|V||85|v|
|22|7||54|W||86|w|
|23|8||55|X||87|x|
|24|9||56|Y||88|y|
|25|:||57|Z||89|z|
|26|;||58|[||90|{|
|27|<||59|&#92;||91|&#124;|
|28|=||60|]||92|}|
|29|>||61|^||93|~|
|30|?||62|_||
|31|@||63|&#096;||

## Phredクオリティスコアとベースコールの正確性

シーケンシングエラー率:

<a href="https://www.codecogs.com/eqnedit.php?latex=\boldsymbol{p}_{error}&space;=&space;10^{-\frac{\boldsymbol{Q}}{10}},&space;\boldsymbol{Q}&space;=&space;Phred\&space;quality\&space;score" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\boldsymbol{p}_{error}&space;=&space;10^{-\frac{\boldsymbol{Q}}{10}},&space;\boldsymbol{Q}&space;=&space;Phred\&space;quality\&space;score" title="\boldsymbol{p}_{error} = 10^{-\frac{\boldsymbol{Q}}{10}}, \boldsymbol{Q} = Phred\ quality\ score" /></a>

- クオリティスコアが10のとき: エラー率は10%、塩基の正確性は90.0%
- クオリティスコアが20のとき: エラー率は1%、塩基の正確性は99.0%
- クオリティスコアが30のとき: エラー率は0.1%、塩基の正確性は99.9%