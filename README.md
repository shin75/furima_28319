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
| birthday          | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type    | Options     |
| ------            | ------  | ----------- |
| name              | string  | null: false |
| image             | string  | null: false | 
| description       | text    | null: false | 
| category          | integer | null: false | 
| states            | integer | null: false | 
| delivery_fee      | integer | null: false |
| prefecture        | integer | null: false |
| delivery_fee      | integer | null: false |

### Association

- belongs_to :user
- has_one :purchase, through: user

## address テーブル

| Column              | Type         | Options     |
| ------              | ----------   | ----------  |
| postal_code         | string       | null: false |
| prefecture          | integer      | null: false |
| city                | string       | null: false |
| address             | string       | null: false |
| building_name       | string       |             |
| phone_number        | string       | null: false |

### Association

- belongs_to :purchases

## purchases（購入管理） テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | string     | null: false, foreign_key: true |
| user_id | string     | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one :address