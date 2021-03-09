class CustomerinfomationPurchaserecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :state_id, :city, :address_line, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :state_id, numericality: { other_than: 1, message: '選択してください' }
    validates :city
    validates :address_line
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end
  
    def save
      
      purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)

      CustomerInfomation.create(postal_code: postal_code, state_id: state_id, city: city, address_line: address_line, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
    end

  
end