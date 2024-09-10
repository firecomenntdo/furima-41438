class PurchaseHistorie < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :item_purchase
end
