# 社内コミュニケーションアプリ SIESTA
業務報告（日報）機能をメインとした社内コミュニケーションアプリです<br>
完成形ではありませんが必要最低限の機能は搭載済です<br>
(2020/9/2現在)<br>
https://calm-ravine-15484.herokuapp.com/

### テストログインユーザー<br>
email: sample@sample.com<br>
password: sample

## 機能
・日報投稿<br>
少ない自由記述欄、プルダウン方式を採用し入力側の負担を視覚的にも減らします<br>
コメント機能も備わっておりフィードバック等にも使用可能です<br>
投稿者は内容の編集・削除も可能です

・簡易掲示板<br>
連絡事項を共有できます<br>
チェックボタンを押すことで内容確認した旨を伝えられます（いわゆるいいね機能）

## なぜ作ろうと思ったか
営業職であった頃「日報作成がもっと楽にならないか」と考えたことがきっかけです<br>
日報は必要でこそありますが作成側としては少なからず手間であること、管理側も部下に何度も提出を促すのが手間ではないかと考えました<br>
そこで日報の入力項目を最低限にする、極力自由入力欄を削ったプルダウン方式にする、自由入力欄も小さくすることで、入力側の「こんなに入力しなければならないのか・・・」という心理的負担を減らした作りにしております<br>
これは入力・提出率の向上および本業へ集中することができる環境づくりに貢献できると考えます



## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, uniqueness: true|
|password|string|null: false|

### Association
- has_many :reports
- has_many :comments
- has_many :boards
- has_many :checks


## reportsテーブル

|Column|Type|Options|
|------|----|-------|
|client|string|null: false|
|client_name|string||
|business|string|null: false|
|result|string|null: false|
|note|text||
|user_id|integer|null: false|

### Association
- has_many :comments
- belongs_to :user


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false|
|report_id|integer|null: false|


### Association
- belongs_to :report
- belongs_to :user


## boardsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|integer|null: false|


### Association
- has_many :checks
- belongs_to :user


## checksテーブル

|Column|Type|Options|
|------|----|-------|
|board_id|integer|null: false|
|user_id|integer|null: false|


### Association
- belongs_to :board
- belongs_to :user
