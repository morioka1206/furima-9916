# README

## Usersテーブル

|comlum               | type         |Option      |
|---------------------|--------------|------------|
|nickname             |string        |null: false |
|email                |string        |unique: true|
|encyrpted_password   |string        |null: false |
|family_name          |string        |null: false |
|first_name           |string        |null: false |
|family_name_kana     |string        |null: false |
|first_name_kana      |string        |null: false |
|birthday             |date          |null: false |

has_many :items
has_one  :purchase_record


## Itemsテーブル
     
 

|comlum               | type         |Option                |
|---------------------|--------------|----------------------|
|name                 |string        |null: false           |
|description          |text          |null: false           |
|category             |string        |null: false           |
|state                |string        |ActiveHash            |
|shipping_cost        |string        |null: false           |
|shipping_day         |string        |null: false           |
|price                |integer       |null: false           |
|condition            |integer       |null: false           |
|user_id              |              |foreign_key: true     |


belongs_to :user
has_one    :customer
has_one    :parchase_record

## Customerテーブル
　
　 

|comlum               | type         |Option                |
|---------------------|--------------|----------------------|
|postal_code          |integer       |null: false           |
|state                |integer       |ActiveHash            |
|city                 |string        |null: false           |
|address_line         |string        |null: false           |
|building_name        |string        |                      |
|phone_number         |string        |null: false           |
|item_id              |              |foreign_key: true     |
|user_id              |              |foreing_key: true     |


belongs_to :item
belongs_to :user

  
## Purchase_recordテーブル
  
|comlum               | type         |Option                |
|---------------------|--------------|----------------------|
|user_id              |reference     |foreing_key: true     |
|state                |integer       |ActiveHash            |

belongs_to :user
belogns_to :item



