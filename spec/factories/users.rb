FactoryBot.define do
  factory :user do
    nickname             {Faker::Name.initials(number: 2)}
    email                {Faker::Internet.free_email}
    password             {'taro11'}
    password_confirmation{'taro11'}
    family_name          {"山田"}
    first_name           {"太郎"}
    family_name_kana     {"ヤマダ"}
    first_name_kana      {"タロウ"}
    birthday             {"1999-01-01"}
  end
end