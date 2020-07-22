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