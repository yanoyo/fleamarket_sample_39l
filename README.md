# README

## Database Design

## users table

|Column|Type|Option|
|------|----|------|
|nickname|string|null: fales|
|email|string|unique: true, null: false|
|password|string|null: false|

### Association

- has_one  :profile
- has_one :sns_credential
- has_many :products, through: :deals
- has_many :favorites, dependent: :destroy
- has_many :messages, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :deals_of_seller, class_name: "Deal", foreign_key: :seller_id, dependent: :destroy
- has_many :deals_of_buyer, class_name: "Deal", foreign_key: :seller_id, dependent: :destroy
- has_many :products_of_seller, through: :deals_of_seller, source: "product"
- has_many :products_of_buyer, through: :deals_of_buyer, source: "product"
- has_many :user_evaluations, dependent: :destroy


## profiles table

|Column|Type|Option|
|------|----|------|
|family_name|string|
|first_name|string|
|family_name_kana|string|
|first_name_kana|string|
|zip|string|
|prefecture|string|
|city|string|
|building|string|
|phone|string|
|birth_year|integer|
|birth_month|integer|
|birth_day|integer|
|profile_content|text|
|profile_image|text|
|profile_icon|text|
|user_id|references|foreign_key: true|

### Association

- belongs_to :user


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

- belongs_to :product


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
