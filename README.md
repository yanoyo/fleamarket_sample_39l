# README

## Database Design

## users table

|Column|Type|Option|
|------|----|------|
|nickname|string|null: fales|
|email|string|unique: true, null: false|
|password|string|null: false|

### Association

- has_one  :profile, dependent: :destroy
- has_one  :address, dependent: :destroy
- has_many :sns_credentials
- has_many :products, through: :deals
- has_many :favorites, dependent: :destroy
- has_many :messages, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :deals_of_seller, class_name: "Deal", foreign_key: :seller_id, dependent: :destroy
- has_many :deals_of_buyer, class_name: "Deal", foreign_key: :seller_id, dependent: :destroy
- has_many :products_of_seller, through: :deals_of_seller, source: "product"
- has_many :products_of_buyer, through: :deals_of_buyer, source: "product"
- has_many :user_evaluations, dependent: :destroy
- accepts_nested_attributes_for :profile, allow_destroy: true, reject_if: :all_blank, update_only: true
- accepts_nested_attributes_for :address, allow_destroy: true, reject_if: :all_blank, update_only: true

## profiles table

|Column|Type|Option|
|------|----|------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|mobile_phone|string|null: false, unique: true|
|profile_image|text|null: true|
|profile_content|text|null: true|
|card_number|string|null: true|
|expiration_month|string|null: true|
|expiration_year|string|null: true|
|security_code|string|null: true|
|user_id|references|foreign_key: true|

### Association

- belongs_to :user, inverse_of: :profile, optional: true
- ※card情報系カラムは payjp 実装後は、別で cards tableを作成し、customer_id,user_idのみでセキュアに管理する。

## addresses table

|Column|Type|Option|
|------|----|------|
|relative_family_name|string|null: false|
|relative_first_name|string|null: false|
|relative_family_name_kana|string|null: false|
|relative_first_name_kana|string|null: false|
|zip_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string|null: true|
|home_phone|string|null: false|
|user_id|references|foreign_key: true|

### Association

- belongs_to :user, inverse_of: :address, optional: true
- belongs_to_active_hash :prefecture

## sns_credentials table

|Column|Type|Option|
|------|----|------|
|uid|stirng|null: false|
|provider|string|null: false|
|user_id|references|foreign_key: true|

### Association

- belongs_to :user


## products table

|Column|Type|Option|
|------|----|------|
|name|text|null: false|
|category_id|references|foreign_key: true|
|price|integer|null: false|
|description|text|null: true|

### Association

- belongs_to :user, through: :deals
- has_many :categories
- belongs_to :brand
- belongs_to :size
- has_many :images, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :comments, dependent: :destroy
- ham_many :sellers, class_name: "User", foreign_key: seller_id, through: :deals
- ham_many :buyers, class_name: "User", foreign_key: buyer_id, through: :deals
- accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :all_blank, update_only: true

## enum
- size
- brand
- image
- condition
- shipping_fee
- shipping_method
- shipping_from
- shipping_term


## comments table

|Column|Type|Option|
|------|----|------|
|comment|text|null: false|
|user_id|references|foreign_key: true|
|product_id|references|foreign_key: true|

### Association

- belong_to :user
- belong_to :product


## favorites table

|Column|Type|Option|
|------|----|------|
|user_id|references|foreign_key: true|
|product_id|references|foreign_key: true|

### Association

- belong_to :user
- belong_to :product


## deals table

|Column|Type|Option|
|------|----|------|
|product_id|reference|foreign_key: true|
|seller_id|reference|foreign_key: true|
|buyer_id|reference|foreign_key: true|

### Association

- belong_to :seller, class_name: "User"
- belong_to :buyer, class_name: "User"
- belong_to :product
- has_one :user_evaluation
- has_many: messages


## messages table

|Column|Type|Option|
|------|----|------|
|message|text|null: false|
|deal_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

### Association

- belong_to :deal


## user_evaluations table

|Column|Type|Option|
|------|----|------|
|evaluation|integer|null: false|
|seller_id|references|foreign_key: true|
|buyer_id|references|foreign_key: true|

### Association

- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :deal


## images table

|Column|Type|Option|
|------|----|------|
|image|text|null: false|
|product_id|references|foreign_key: true|

### Association

- belongs_to :product, inverse_of :images


## categories table

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|ancestry|string|add_index|

### Association

- has_many :sizes
- belongs_to :product


## sizes table

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|category_id|references|foreign_key: true|

### Association
- has_many :products
- belongs_to :category


## brands table

|Column|Type|Option|
|------|----|------|
|name|string|null: false|

### Association

- has_many :products
