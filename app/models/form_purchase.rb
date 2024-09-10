class FormPurchase
  include ActiveModel::Model
  attr_accessor :address_number, :prefecture_id, :address, :block_number, :building_name, :phone_number, :purchase_history,
                :user, :item

  with_options presence: true do
    validates :address_number, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンと数字を含めてください' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :address
    validates :block_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は11字以下で入力してください' }
    validates :purchase_history
    validates :user
    validates :item
  end

  def save
    ItemPurchase.create(address_number:, prefecture_id:, address:, block_number:, building_name:, phone_number:,
                        purchase_history:)
  end
end
