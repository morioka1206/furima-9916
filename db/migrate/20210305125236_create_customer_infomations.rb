class CreateCustomerInfomations < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_infomations do |t|
      t.string         :postal_code        ,null: false
      t.integer        :state_id           ,null: false
      t.string         :city               ,null: false
      t.string         :address_line       ,null: false
      t.string         :building_name       
      t.string         :phone_number       ,null: false
      t.references     :purchase_record    ,foreign_key: true
      t.timestamps
    end
  end
end