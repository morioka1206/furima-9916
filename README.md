# README

## Usersテーブル

|comlum               | type         |Option   |
|---------------------|--------------|---------|
|nickname             |string        |NOT NULL |
|email                |string        |NOT NULL |
|password             |string        |NOT NULL |
|password_confirmation|string        |NOT NULL |
|family_name          |string        |NOT NULL |
|first_name           |string        |NOT NULL |
|family_name_kana     |string        |NOT NULL |
|first_name_kana      |string        |NOT NULL |
|birthday             |date          |NOT NULL |

has_many :items
has_one  :customer


## Itemsテーブル
     
 



|comlum               | type         |Option                |
|---------------------|--------------|----------------------|
|name                 |string        |NOT NULL              |
|description          |text          |NOT NULL              |
|image                |              |ActiveStorage         |
|category             |string        |NOT NULL              |
|shipping_area        |string        |ActiveHash            |
|shipping_cost        |string        |NOT NULL              |
|shipping_day         |string        |NOT NULL              |
|price                |integer       |NOT NULL              |
|condition            |integer       |NOT NULL              |
|user_id              |              |foreign_key: true     |


belongs_to :user
has_one    :customer

## Customerテーブル
　
　 

|comlum               | type         |Option                |
|---------------------|--------------|----------------------|
|postal_code          |integer       |NOT NULL              |
|state                |integer       |ActiveHash            |
|city                 |string        |NOT NULL              |
|address_line         |string        |NOT NULL              |
|building_name        |string        |                      |
|phone_number         |integer       |NOT NULL              |
|shipping_day         |string        |NOT NULL              |
|item_id              |              |foreign_key: true     |
|user_id              |              |foreing_key: true     |


belongs_to :items
belongs_to :user






