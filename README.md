## usersテーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nick_name          | string  | null: false               |
| password           | string  | null: false               |
| mail               | string  | null: false, unique: true |
| first_name         | string  | null: false               |
| first_name_kana    | string  | null: false               |
| family_name        | string  | null: false               |
| family_name_kana   | string  | null: false               |
| birth_year         | integer | null: false               |
| birth_month        | integer | null: false               |
| birth_days         | integer | null: false               |

### Association
- has_many :items
- has_many :records


## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | text       | null: false                    |
| goods              | string     | null: false                    |
| goods_explanation  | text       | null: false                    |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| charge             | string     | null: false                    |
| area               | string     | null: false                    |
| shipping_days      | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :record


## recordテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     | null: false                    |
| telephone_number | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :record