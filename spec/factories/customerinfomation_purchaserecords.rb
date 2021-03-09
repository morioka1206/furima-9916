FactoryBot.define do
  factory :customerinfomation_purchaserecord do
    postal_code {"156-0032"}
    state_id {8}
    city {"中野区"}
    address_line {"4丁目2-3"}
    building_name {""}
    phone_number {"09012345678"}

    token {"tok_abcdefghijk00000000000000000"}
    user_id {1}
    item_id {1}
  end
end
