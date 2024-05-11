# README

## users テーブル

| Column             | Type   | Options                   |
| -----------------  | ------ | --------                  |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |

has_many :lists
has_many :resipes

## recipes テーブル

| Column             | Type    | Options     |
| -----------------  | ------  | --------    |
| name               | string  | null: false |
| category_id        | integer | null: false |
| kondate_id         | integer | null: false |
| people             | string  | null: false |

belongs_to :category
belongs_to :kondate
has_many :foods, dependent: :destroy
has_one_attached :image
belongs_to :lists
has_many :users


## foods テーブル

| Column    | Type       | Options     |
| -------   | ------     | --------    |
| name      | string     | null: false |
| amount    | integer    | null: false |
| unit      | string     | null: false |
| recipe_id | references | null: false |

belongs_to :recipe

## recipe_foods テーブル

| Column | Type       | Options     |
| -------| ------     | --------    |
| recipe | references | null: false |
| food   | references | null: false |

belongs_to :recipe
belongs_to :food


## lists テーブル

| Column | Type       | Options     |
| -------| ------     | --------    |
| user   | references | null: false |
| memo   | text       |             |

belongs_to :user
has_many :recipes