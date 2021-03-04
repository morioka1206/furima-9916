FactoryBot.define do
  factory :item do
    association :user
    
    name             {Faker::Device.model_name}
    description      {Faker::Lorem.sentence}
    price            {300}
    category_id      {3}
    state_id         {3} 
    shipping_cost_id {3}
    shipping_day_id  {3}
    condition_id     {3}
  end
end
