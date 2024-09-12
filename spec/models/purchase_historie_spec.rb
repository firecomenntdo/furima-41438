require 'rails_helper'

RSpec.describe PurchaseHistory, type: :model do
  before do
    @purchase_history = FactoryBot.build(:purchase_history)
  end
end
