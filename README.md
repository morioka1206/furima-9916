# README

## Usersテーブル

|comlum               | type         |Option                  |
|---------------------|--------------|------------------------|
|nickname             |string        |null: false             |
|email                |string        |unique: true, null:false|
|encyrpted_password   |string        |null: false             |
|family_name          |string        |null: false             |
|first_name           |string        |null: false             |
|family_name_kana     |string        |null: false             |
|first_name_kana      |string        |null: false             |
|birthday             |date          |null: false             |

has_many  :items
has_many  :purchase_records


## Itemsテーブル
     
 

|comlum               | type         |Option                |
|---------------------|--------------|----------------------|
|name                 |string        |null: false           |
|description          |text          |null: false           |
|category_id          |integer       |ActiveHash            |
|state_id             |integer       |ActiveHash            |
|shipping_cost_id     |integer       |ActiveHash            |
|shipping_day_id      |integer       |ActiveHash            |
|conditon_id          |integer       |ActiveHash            |
|price                |integer       |null: false           |
|user                 |references    |foreign_key: true     |

belongs_to :user
has_one    :parchase_record

## Customer_infomationテーブル
　
　 

|comlum               | type         |Option                |
|---------------------|--------------|----------------------|
|postal_code          |string        |null: false           |
|state_id             |integer       |ActiveHash            |
|city                 |string        |null: false           |
|address_line         |string        |null: false           |
|building_name        |string        |                      |
|phone_number         |string        |null: false           |
|purchase_record      |references    |foreign_key_true      |

belongs_to :purchase_record

  
## Purchase_recordテーブル
  
|comlum               | type         |Option                |
|---------------------|--------------|----------------------|
|user                 |references    |foreing_key: true     |
|item                 |references    |foreing_key: true     |

has_one :customer_infomation
belongs_to :user
belongs_to :item


