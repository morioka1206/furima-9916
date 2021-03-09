FactoryBot.define do
  factory :customerinfomation_purchaserecord do
    user_id { FactoryBot.create(:user) }
    item_id { FactoryBot.create(:item) }
    postal_code {"156-0032"}
    state_id {8}
    city {"中野区"}
    address_line {"4丁目2-3"}
    building_name {""}
    phone_number {"09012345678"}

    token {"tok_abcdefghijk00000000000000000"}
    
  end
end
