FactoryBot.define do
  factory :item_purchase do
    association :purchase_history
  end
end
