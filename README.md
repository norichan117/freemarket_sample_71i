# テーブル設計

## userテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false unique: true|
|first_name|string|null: false|
|family_name|string|null: false|
|email|string|null: false, unique: true|
|nickname|string|null: false, unique: true|
|password|string|null: false|
|birthday|date|null: false|
|card_id|integer|foreign_key: true|

### Association
- has_many :items
- has_one :customer
- has_one :card


## itemテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|item_name|string|
|user_id|integer|foreign_key: true|
|category_id|integer|foreign_key: true|
|item_info|string|
|price|integer|
|image1|string|
|image2|string|
|image3|string|
|postage|integer|
|shipping_area|string|
|days_to_ship|integer|
|customer_id|integer|foreign_key: true|
|closed_flag|integer|

### Association
- belongs_to :user
- belongs_to :category
- has_one :customer


## customerテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|string|foreign_key: true|
|yubin_bango|string|
|todofuken|string|
|shichoson|string|
|banchi|string|
|tel_no|integer|

### Association
- belongs_to :user
- belongs_to :item


## cardテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|id|string|null: false, unique: true|
|category_name|string|

### Association
- has_many :items

