## usersテーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nick_name          | string  | null: false               |
| encrypted_password | string  | null: false               |
| email              | string  | null: false, unique: true |
| first_name         | string  | null: false               |
| first_name_kana    | string  | null: false               |
| family_name        | string  | null: false               |
| family_name_kana   | string  | null: false               |
| birth_day          | date    | null: false               |

### Association
- has_many :items
- has_many :records


## itemsテーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| goods_name        | string     | null: false                    |
| goods_explanation | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| charge_id         | integer    | null: false                    |
| area_id           | integer    | null: false                    |
| ship_id           | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :record


## recordsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| area_id          | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false                    |
| record           | references | null: false, foreign_key: true |

### Association
- belongs_to :record