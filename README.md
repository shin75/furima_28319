# README
# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| name         | string | null: false |
| birthday     | string | null: false |
| 

### Association

- has_many :items
- has_one  :buyer
- has_many :buy

## items テーブル

| Column            | Type   | Options     |
| ------            | ------ | ----------- |
| product_name      | string | null: false |
| category          | string | null: false | 
| exhibitor         | string | null: false | 
| description       | string | null: false | 
| shipping_charges  | string | null: false | 
| image             | string | null: false |
| items_id          | string | null: false |

### Association

- has_one  :users
- has_one :buy, through: users

## buyer テーブル

| Column              | Type         | Options                        |
| ------              | ----------   | ------------------------------ |
| delivery_address    | string       | null: false, foreign_key: true |
| phone number        | integer      | null: false, foreign_key: true |
| postal code         | integer      | null: false, foreign_key: true |
| municipalities      | string       | null: false, foreign_key: true |
| address             | string       | null: false, foreign_key: true |
| building number     | integer      | null: false, foreign_key: true |

### Association

- belongs_to :users

## buy（購入管理） テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | string     | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :buyer