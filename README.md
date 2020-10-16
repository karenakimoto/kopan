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


