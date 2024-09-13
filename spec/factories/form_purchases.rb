FactoryBot.define do
  factory :form_purchase do
    price { 15_000 }
    token { 'tok_abcdefghijk00000000000000000' }
    address_number   { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    prefecture_id    { 2 }
    address          { Faker::Lorem.sentence }
    block_number     { Faker::Lorem.sentence }
    building_name    { Faker::Lorem.sentence }
    phone_number     { Faker::Number.leading_zero_number(digits: 11) }
  end
end
