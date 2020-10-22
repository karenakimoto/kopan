# アプリケーション名

KOPAN(コパン)

# アプリケーション概要

トーストを美味しく食べるためのアレンジしたレシピを投稿できるアプリ

# URL
https://kopan-29717.herokuapp.com/

# テスト用アカウント
メールアドレス : test@gmail.com パスワード : test1234


# 利用方法

## 投稿方法

新規登録を行い、画面右下の食パンのイラストがボタンになっています。クリックすると投稿ページに遷移できます。フォームに記入後、画面下の投稿ボタンを押すことにより情報が投稿・公開されます。

# 目指した課題解決

Aさん「パンが好きで、トーストをいろんな食べ方でアレンジして食べるのが大好き！自分が考えたトーストのレシピを投稿できるおプリがあったらいいなあ」>>> 投稿機能
Bさん「いつもバターとジャムで飽きたなあ、、、もっと美味しく食べたい！いろんな人のトーストのアレンジレシピを見られるアプリがあったらいいな」
＋全てのパン好きの皆さんに！

# 洗い出した要件(要件定義)

|優先順位|機能|目的|詳細|ストーリー(ユースケース)|見積もり時間|
|:--:|:--:|:--:|:--:|:--:|:--:|
|6|ユーザー登録機能|ユーザー登録できるようにするため|・名前、メールアドレス、パスワードを入力すると登録できる|レシピ閲覧だけならユーザー登録は必要なし<br>レシピ投稿の際には新規登録が必要|12時間|
|5|レシピ投稿機能|レシピを投稿できるようにするため|・画像、トースト名、食パンの種類、枚切り、材料、レシピを入力すると投稿できる（カロリーは入力してもしなくてもOK）|ログインしているユーザーは投稿できる<br>トップページから投稿ボタンを押してフォームを入力して投稿ボタンを押すと投稿される|24時間|
|4|レシピ一覧表示機能|レシピを一覧表示させるため|・トップページに投稿されたレシピを新しい順に表示させるようにする|投稿するとトップページに新しい順に並べられて表示される|12時間|
|3|レシピ詳細表示機能|レシピの詳細を表示させるため|・表示されているレシピをクリックすると、そのレシピの詳細ページに遷移する|トップページに表示されているレシピをクリックすると、そのレシピの詳細ページに遷移する|12時間|
|2|レシピ削除機能|レシピを削除できるようにするため|・そのレシピを投稿したユーザーはレシピを削除できる|そのレシピを投稿したユーザーは詳細ページからレシピを削除できる|12時間|
|1|コメント機能|投稿されたレシピにコメントできるようにするため|・投稿されているレシピの詳細ページからコメントできる（何回も）|そのレシピを投稿したユーザー以外は詳細ページからコメントできる|30時間|

# 実装した機能についてのGIFと説明

投稿機能
https://gyazo.com/75430cd1e9a938ac97da92d49fd2e46f
ボタンの装飾
https://gyazo.com/82d22b3b61880aaf9ed8613206fb4a30
投稿されたレシピの一覧表示
https://gyazo.com/fa85537710a570e885eb08ada8804f1a
テーブルタグを用いた実装
https://gyazo.com/3f78927261e0b0da7f43fb4219b0cb09

# 実装予定の機能

コメント機能を非同期で表示させたい

# データベース設計

https://gyazo.com/3acca139745977acc8e4d2ac4161f963

# ローカルでの動作方法

```ruby
git clone https://github.com/karenakimoto/kopan.git
cd kopan
bundle install
yarn install
rails db:create
rails db:migrate
rails s
```

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column     | Type   | Options   |
|------------|--------|-----------|
|name        |string  |null: false|
|email       |string  |null: false|
|password    |string  |null: false|

### アソシエーション

- has_many :recipes

## recipes テーブル

| Column       | Type   | Options                        |
|--------------|--------|--------------------------------|
|name          |string  |null: false                     |
|bread         |string  |null: false                     |
|breadtype_id  |integer |null: false                     |
|material      |string  |null: false                     |
|recipe        |text    |null: false                     |
|calorie       |integer |null: false                     |
|user          |references|null: false, foreign_key: true|

### アソシエーション

- belongs_to :user
- has_one_attached :image
- belongs_to_active_hash :breadtype

## commentsテーブル

| Column | Type ----| Options                      |
|--------|----------|------------------------------|
|text----|text------|null: false                   |
|user----|references|null: false, foreign_key: true|
|item----|references|null: false, foreign_key: true|

### アソシエーション

- belongs_to :user
- belongs_to :recipe
