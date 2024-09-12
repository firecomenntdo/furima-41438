require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @item_purchase = FactoryBot.build(:item_purchase)
  end
  describe '商品購入機能' do
    context '商品購入できる時' do
      it 'すべての値が正しく入力されていれば購入できる' do
      end
      it '建物名は空でも購入できる' do
      end
    end
    context '商品購入できない時' do
      it '郵便番号が空だと購入できない' do
      end
      it '郵便番号にハイフンがないと購入できない' do
      end
      it '郵便番号が全角文字だと購入できない' do
      end
      it '郵便番号が半角英字だと購入できない' do
      end
      it '都道府県が空だと購入できない' do
      end
      it '住所が空だと購入できない' do
      end
      it '番地が空だと購入できない' do
      end
      it '電話番号が空だと購入できない' do
      end
      it '電話番号にハイフンが入っていると購入できない' do
      end
      it '電話番号が11桁以上だと購入できない' do
      end
      it '電話番号が全角数字だと購入できない' do
      end
      it '電話番号が英字だと購入できない' do
      end
      it 'purchese_historyと紐づいていないと購入できない' do
      end
    end
  end
end
