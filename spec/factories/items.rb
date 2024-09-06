FactoryBot.define do
  factory :item do
    title                        { Faker::Lorem.sentence }
    image                        { nil }
    context                      { Faker::Lorem.sentence }
    category_id { 2 }
    item_status_id { 2 }
    shipping_id { 2 }
    prefecture_id { 2 }
    shipping_date_id { 2 }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      # attach : 取り付ける 「public/images/test_image.png」を「test_image.png」としてitemモデルにアタッチする
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
