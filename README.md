# Let's Enjoy Hawaii

ハワイ諸島の人気アクティビティや人気店等の情報を日本語で掲載し、口コミや評価を手軽に投稿できるサイトです。

# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| name               | string  | null: false, default: "" |
| email              | string  | null: false, default: "" |
| introduce          | text    |                          |
| image              | text    |                          |
| encrypted_password | string  | null: false, default: "" |
| admin              | integer |                          |

### Association

- has_one_attached :image
- has_many :reviews, dependent: :destroy
- has_many :histories, dependent: :destroy
- has_many :his_exps, through: :histories, source: :experience
- has_many :favorites, dependent: :destroy
- has_many :fav_exps, through: :favorites, source: :experience

## experiences テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false, default: ""       |
| outline               | text       |                                |
| image                 | text       |                                |
| address               | string     | null: false                    |
| latitude              | integer    | null: false                    |
| longitude             | integer    | null: false                    |
| type_id               | integer    | null: false                    |
| business_hours_start  | string     |                                |
| business_hours_finish | string     |                                |
| area                  | references | null: false, foreign_key: true |
| genre                 | references | null: false, foreign_key: true |

### Association

- has_one_attached :image
- belongs_to :area
- belongs_to :genre
- has_many :reviews
- has_many :histories
- has_many :his_users, through: :histories, source: :user
- has_many :favorites
- has_many :fav_users, through: :favorites, source: :user

## histories テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| experience | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :experience

## reviews テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| comment    | text       | null: false                    |
| score_id   | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |
| experience | references | null: false, foreign_key: true |

### Association

- belongs_to_active_hash :score
- belongs_to :user
- belongs_to :experience

## favorites テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| experience | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :experience

## areas テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| name      | string  | null: false |
| island_id | integer | null: false |

### Association

- belongs_to_active_hash :island
- has_many :experiences

## genres テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

- has_many :experiences

# ER図
https://i.gyazo.com/0bb2f584edcd557aa5b447177635d4fc.png

# 作者
### 山崎 泰則
Twitter : https://twitter.com/yasunori_aloha

Qiita : https://qiita.com/yasunori_aloha

メールはこちらへ : t26.yasunori.yamasaki@gmail.com