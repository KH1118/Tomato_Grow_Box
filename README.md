# CO2センサーの開発
トマトを栽培するためのグロウボックス（室内栽培ルーム）で使用するCO2センサーを開発しました。<br>
センサーはArduinoによって制御されます。二酸化炭素濃度は、約10分間の間隔で測定され、測定値はRubyを使用してグラフに変換されます。
## グロウボックスのセットアップ
#### グロウボックス
120×120×200cm
#### LED植物育成ライト
地上から約1mに設置
#### 灌漑システム
ポンプを使用して、ボックス外のバケツからチューブを通して水を運びます。
#### タイマー
午前6時から午後6時まではタイマーを使用して照明とCO2をオンにし、午後6時から午前6時まではオフに設定します。<br><br>
###### co2_concentration.png ・・・紫のグラフは実際にCO2センサーをつけて実験したものです。平均二酸化炭素濃度は1464 ppmでした。もう一方の緑のグラフは自然のままで測定し、平均二酸化炭素濃度は433 ppmでした。
