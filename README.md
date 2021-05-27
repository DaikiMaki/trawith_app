# TRAWITH

トレーニングパートナーを募集するサービスになります。  
写真やトレーニングしたい場所、部位などを入力して募集をかけることができます。  
レスポンシブに対応しているので、PCだけでなく、スマートフォンやタブレットからもストレスなく利用することができます。　

<img width="1434" alt="スクリーンショット 2021-05-23 19 36 14" src="https://user-images.githubusercontent.com/75789463/119455288-68615f80-bd74-11eb-87bd-fdadbcfadadd.png">


# ターゲット層

* 筋トレを普段一人で行っている方  
* 毎回同じ環境で筋トレを行なっている方  
* 筋トレが趣味の恋人を作りたい方

# ユーザーの抱える問題

* 筋トレを趣味とする友人を増やしたい  
* 新しい環境で筋トレがしたいが、一人では勇気が出ない  
* 筋トレを理解してくれる恋人が欲しい

# 解決方法

* 筋トレを趣味としている方との出会いの場を作る

# 実装した機能についてのGIFと説明

  新規登録  
  ![新規登録](https://user-images.githubusercontent.com/75789463/119630349-d4fa5e00-be49-11eb-8498-330fb1449d37.gif)  
  メール認証  
  ![新規登録メール認証](https://user-images.githubusercontent.com/75789463/119631885-45ee4580-be4b-11eb-9831-763b15ed88c5.gif)  
  パスワード再設定  
  ![パスワード再設定](https://user-images.githubusercontent.com/75789463/119636567-b9925180-be4f-11eb-9466-10ccf6d6929f.gif)  
  メールが送られてくる  
  ![パスワード再設定 メールgif](https://user-images.githubusercontent.com/75789463/119636701-d9c21080-be4f-11eb-93c0-5514be1f4cb4.gif)  
  新規投稿  
  ![新規投稿](https://user-images.githubusercontent.com/75789463/119634692-f3faef00-be4d-11eb-9c49-b2e7fc3bfbb4.gif)  
  トーク  
  ![トーク](https://user-images.githubusercontent.com/75789463/119637697-e4c97080-be50-11eb-8f49-e38d5b91874c.gif)  
  フォロー  
  ![フォロー](https://user-images.githubusercontent.com/75789463/119638368-894bb280-be51-11eb-9ad5-e46f568d6143.gif)  
  通知  
  ![通知](https://user-images.githubusercontent.com/75789463/119639335-79809e00-be52-11eb-90ad-e73142f9224a.gif)  
  検索  
  ![検索](https://user-images.githubusercontent.com/75789463/119640194-52769c00-be53-11eb-828b-ace9c2f896f3.gif)  
  無限スクロール  
  ![無限スクロール](https://user-images.githubusercontent.com/75789463/119653435-48a86500-be62-11eb-9872-6c8a0a45eb8c.gif)  



# こだわりのポイント

**こだわりのポイント**は**三つ**あります。  

* **既存のサービスとの差別化のため、募集をかける際にトレーニングしたい部位を必須項目にしている**

  これを行うことにより、募集をかけたユーザーがどの部位をトレーニングしたいかあらかじめ把握でき、他のユーザーの無駄な確認の手間を省くことができます。  
  また、部位ごとにトレーニングを考えるというのは、トレーニングを趣味にしている人でないとわかりません。  
  そのため、このサービスを利用するユーザーを本当にトレーニングを趣味にしている方に絞ることができます。  

* **先ほど必須項目にしたトレーニングしたい部位を使って検索をかけることができる**

  人によってトレーニングが得意な部位、苦手な部位が必ずあります。  
  そのため、部位ごとに検索をかけられることによって、得意な部位をより磨きたい方、苦手を克服したい方など目的に応じた利用ができるようになります。  

* **どの端末からでもベストな操作性**

  レスポンシブデザインを意識し、端末ごとにページネーションになっていたところを無限スクロールに変えたり、jqueryなどを用いてサイトを見やすくしたりして、UI/UXを整えました。

# 機能一覧

* ユーザー登録、ログイン機能  
* 投稿機能  
* トーク機能(ActionCable)  
* フォロー機能(Ajax)  
* 通知機能  
* ページネーション機能(kaminari)  
* 無限スクロール機能(jscroll & kaminari)  
* 検索機能(ransack)  

# 使用技術

* Ruby 2.6.3  
* Ruby on Rails 6.0.3  
* Ubuntu
* AWS
  * VPC
  * EC2
  * RDS
  * Route53

# ER図

<img width="845" alt="スクリーンショット 2021-05-26 12 03 05" src="https://user-images.githubusercontent.com/75789463/119596914-07409700-be1b-11eb-8dda-a5e465e748b7.png">


# Author

* 牧大貴
* makidaiki9180@gmail.com

# License

ライセンスを明示する

"hoge" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).