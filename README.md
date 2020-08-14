# README
# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| family_name       | string | null: false |
| first_name        | string | null: false |
| family_name_kana  | string | null: false |
| family_name_kana  | string | null: false |
| birth_date        | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type   | Options     |
| ------            | ------ | ----------- |
| name              | string | null: false |
| image             | string | null: false | 
| description       | string | null: false | 
| category          | string | null: false | 
| states            | string | null: false | 
| delivery_fee      | string | null: false |
| prefecture        | string | null: false |
| delivery_fee      | string | null: false |

### Association

- has_one  :users
- has_one :purchases, through: users

## address テーブル

| Column              | Type         | Options     |
| ------              | ----------   | ----------  |
| postal_code         | string       | null: false |
| prefecture          | string       | null: false |
| city                | string       | null: false |
| address             | string       | null: false |
| building_name       | string       | null: false |
| phone_number        | string       | null: false |

### Association

- has_one :purchases

## purchases（購入管理） テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | string     | null: false, foreign_key: true |
| user_id | string     | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :address