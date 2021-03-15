# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true| 
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column      | Type     | Options     |
| ----------- | -------- | ----------- |
| user        |references|foreign_key: true|
| name        | string   | null: false |
| text        | text     | null: false |
| category_id | integer  | null: false |
| status_id   | integer  | null: false |
| charge_id   | integer  | null: false |
| area_id     | integer  | null: false |
| day_id      | integer  | null: false |
| price       | integer  | null: false |

### Association

- has_one : order
- belongs_to : user

## order テーブル
| Column  | Type      | Options     |
| ------- | --------- | ----------- |
| user    | references|foreign_key: true|
| item    | references|foreign_key: true|

### Association

- has_one : address
- belongs_to : user
- belongs_to : item

## address テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| postal_code     | string   | null: false |
| area_id         | integer  | null: false |
| municipality    | string   | null: false |
| address         | string   | null: false |
| building_name   | string   |
| phone_number    | string   | null: false |
| order           |references|foreign_key: true|

### Association

- belongs_to : order
