# テーブル設計

## userテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false unique: true|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|

### Association
- has_many :items
- has_many :tradings
- has_one :user_address
- has_one :user_card

## user_cardテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

## user_addressテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|integer|foreign_key: true|
|user_yubin_bango|string|
|user_todofuken|string|
|user_shichoson|string|
|user_banchi|string|
|user_building|string|

### Association
- belongs_to :user

## deliver_addressテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|string|foreign_key: true|
|deliver_family_name|string|
|deliver_first_name|string|
|deliver_family_name_kana|string|
|deliver_first_name_kana|string|
|deliver_yubin_bango|string|
|deliver_todofuken|string|
|deliver_shichoson|string|
|deliver_banchi|string|
|deliver_building|string|
|deliver_tel_no|string|

### Association
- belongs_to :user

## itemテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|integer|foreign_key: true|
|item_name|string|
|item_info|string|
|category_id|integer|foreign_key: true|
|brand_id|integer|foreign_key: true|
|condition|string|
|postage_burden|string|
|shipping_area|string|
|days_to_ship|string|
|price|integer|
|trading_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :trading
- has_many :images

## imageテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|item_id|integer|foreign_key: true|
|item_image|string|

### Association
- belongs_to :item

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|id|string|null: false, unique: true|
|category_name|string|

### Association
- has_many :items

## brandテーブル
|Column|Type|Options|
|------|----|-------|
|id|string|null: false, unique: true|
|brand_name|string|

### Association
- has_many :items

## tradingテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|string|foreign_key: true|
|trading_family_name|string|
|trading_first_name|string|
|trading_family_name_kana|string|
|trading_first_name_kana|string|
|trading_yubin_bango|string|
|trading_todofuken|string|
|trading_shichoson|string|
|trading_banchi|string|
|trading_building|string|
|trading_tel_no|string|
|trading_card_id|string|
|trading_customer_id|string|

### Association
- belongs_to :user
- has_one :item




