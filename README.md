# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| name           | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana| string | null: false |
| birthday       | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column   | Type     | Options     |
| -------- | -------- | ----------- |
| user_id  |references|foreign_key: true|
| item_name| text     | null: false |
| text     | text     | null: false |
| category | integer  | null: false |
| status   | integer  | null: false |
| charge   | integer  | null: false |
| area     | integer  | null: false |
| day      | integer  | null: false |
| price    | string   | null: false |

### Association

- has_one : order
- belongs_to : user

## order テーブル
| Column  | Type      | Options     |
| ------- | --------- | ----------- |
| user_id | references|foreign_key: true|
| item_id | references|foreign_key: true|

### Association

- has_one : address
- belongs_to : user
- belongs_to : item

## address テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| postal_code     | string   | null: false |
| prefectures     | integer  | null: false |
| municipality    | string   | null: false |
| address         | string   | null: false |
| building_name   | string   |
| phone_number    | string   | null: false |
| order_id        |references|foreign_key: true|

### Association

- belongs_to : order
