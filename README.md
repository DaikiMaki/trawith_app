# TRAWITH

トレーニングパートナーを募集するサービスです。  
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

## アカウント関連  

### 新規登録  
必要な情報を入力します。  
![新規登録](https://user-images.githubusercontent.com/75789463/119630349-d4fa5e00-be49-11eb-8498-330fb1449d37.gif)  

#### メール認証(ActionMailerを用いて)  

新規登録した際に登録したメールアドレスに認証メールが届きます。  
メールに記載されているリンクをクリックすることでアカウントを認証し、有効にすることができます。  
![新規登録メール認証](https://user-images.githubusercontent.com/75789463/119631885-45ee4580-be4b-11eb-9831-763b15ed88c5.gif)  

### パスワード再設定  

新規登録した際に登録したメールアドレスを入力します。  
![パスワード再設定](https://user-images.githubusercontent.com/75789463/119636567-b9925180-be4f-11eb-9466-10ccf6d6929f.gif)  

#### メール認証(ActionMailerを用いて)  

送られてきたメールに記載されているリンクをクリックすることで、パスワードを変更することができます。  
![パスワード再設定 メールgif](https://user-images.githubusercontent.com/75789463/119636701-d9c21080-be4f-11eb-93c0-5514be1f4cb4.gif)  

### ログイン  

登録した内容を入力します。
![ログイン](https://user-images.githubusercontent.com/75789463/119784819-8dd3a200-bf09-11eb-985b-da6c6cbd78e1.gif)  

### ログアウト  

![ログアウト](https://user-images.githubusercontent.com/75789463/119784009-c0c96600-bf08-11eb-9210-7752d17bded4.gif)  

### アカウント編集  

アカウントの基本情報などが変更でき、ここで自己紹介やプロフィール画像も設定することができます。  
![アカウント編集](https://user-images.githubusercontent.com/75789463/119762046-f3169b80-bee7-11eb-9a3b-5fc08210c70c.gif)  

### プロフィール  

投稿やフォロー、フォロワーを見ることができます。  
![プロフィール](https://user-images.githubusercontent.com/75789463/119782321-05540200-bf07-11eb-9bff-3f56c11ca3d9.gif)  

### アカウント削除  

![アカウント削除](https://user-images.githubusercontent.com/75789463/119761098-2ce6a280-bee6-11eb-8f35-3ef837f75963.gif)  

## フォロー(Ajaxを用いて)  

アカウント情報のアイコンをクリックすることでフォロー、フォロー解除することができます。  
![フォロー](https://user-images.githubusercontent.com/75789463/119638368-894bb280-be51-11eb-9ad5-e46f568d6143.gif)  

## 投稿関連  

### 新規投稿  

一緒にトレーニングしたい場所、部位を選択し、より詳細な情報をフォームに入力することで、投稿することができます。  
![新規投稿](https://user-images.githubusercontent.com/75789463/119763124-e09d6180-bee9-11eb-97e5-449bd82ac34c.gif)  

### 投稿検索(ransackを用いて)  

場所か部位を選択することで、それに合わせた投稿を取得することができます。  
![検索](https://user-images.githubusercontent.com/75789463/119640194-52769c00-be53-11eb-828b-ace9c2f896f3.gif)  

### フォローしたユーザーの投稿

フォローしたユーザーの投稿を表示できます。  
![フォローしている投稿](https://user-images.githubusercontent.com/75789463/119778758-db98dc00-bf02-11eb-8372-201dffcb8e18.gif)

### 投稿削除  

自分が投稿したものを削除することができます。
![投稿削除](https://user-images.githubusercontent.com/75789463/119763486-97014680-beea-11eb-84b1-6e53e3652670.gif)  

## トーク(ActionCableを用いて)  

相手のプロフィール欄にあるトークを始めるをクリックすることで、メッセージを送ることができます。  
![トーク](https://user-images.githubusercontent.com/75789463/119763995-8f8e6d00-beeb-11eb-969a-fe6e55f425fd.gif)  

### トークルーム削除  

![トークルーム削除](https://user-images.githubusercontent.com/75789463/119764518-83ef7600-beec-11eb-8483-ca2f846acab9.gif)  

## 通知関連　

### 通知  

フォローされた時、メッセージが送られてきた時にベルマークにオレンジ色のマークが表示されます。　
![通知](https://user-images.githubusercontent.com/75789463/119764979-4fc88500-beed-11eb-989a-c8108be63262.gif)  

### メッセージが送られてきた場合  

![通知　メッセージ](https://user-images.githubusercontent.com/75789463/119765643-9d91bd00-beee-11eb-903f-98de5544fe18.gif)  

### フォローされた場合  

![通知　フォロー](https://user-images.githubusercontent.com/75789463/119766145-7687bb00-beef-11eb-8349-943e6d3d7412.gif)  

## お問い合わせ  

フォームに問い合わせたい内容を入力します。  
![お問い合わせ](https://user-images.githubusercontent.com/75789463/119776395-d9814e00-beff-11eb-92f8-c5dae8411c6d.gif)　

あらかじめ指定しておいたメールアドレスに先程のお問い合わせが送られてきます。  
![お問い合わせ　メール](https://user-images.githubusercontent.com/75789463/119777103-b6a36980-bf00-11eb-8cdf-52f69ecbe823.gif)  

## ページネーション(kaminariを用いて)　

投稿一覧などの一部のページで、ページネーションを取り入れています。  　
![ページネーション](https://user-images.githubusercontent.com/75789463/119756249-3f5cde00-bede-11eb-9de6-ba770d244191.gif)　

## 無限スクロール（kaminariとjscrollを用いて)  

レスポンシブデザインを意識し、タブレットとスマートフォンの時はページネーションされていた箇所を無限スクロールに変更しています。  
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
* 検索機能(ransack)  
* ページネーション機能(kaminari)  
* 無限スクロール機能(jscroll & kaminari)  

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