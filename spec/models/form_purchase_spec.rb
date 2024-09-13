require 'rails_helper'

RSpec.describe FormPurchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    sleep 0.1
    @form_purchase = FactoryBot.build(:form_purchase, user_id: user.id, item_id: item.id)
  end
  describe '商品購入機能' do
    context '商品購入できる時' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@form_purchase).to be_valid
      end
      it '建物名は空でも購入できる' do
        @form_purchase.building_name = ''
        expect(@form_purchase).to be_valid
      end
    end
    context '商品購入できない時' do
      it '郵便番号が空だと購入できない' do
        @form_purchase.address_number = ''
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include 'Address number はハイフンと数字を含めてください'
      end
      it '郵便番号にハイフンがないと購入できない' do
        @form_purchase.address_number = '1111111'
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include 'Address number はハイフンと数字を含めてください'
      end
      it '郵便番号が全角文字だと購入できない' do
        @form_purchase.address_number = 'あいうえお'
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include 'Address number はハイフンと数字を含めてください'
      end
      it '郵便番号が半角英字だと購入できない' do
        @form_purchase.address_number = 'abc-degh'
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include 'Address number はハイフンと数字を含めてください'
      end
      it '都道府県が空だと購入できない' do
        @form_purchase.prefecture_id = '1'
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '住所が空だと購入できない' do
        @form_purchase.address = ''
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include "Address can't be blank"
      end
      it '番地が空だと購入できない' do
        @form_purchase.block_number = ''
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include "Block number can't be blank"
      end
      it '電話番号が空だと購入できない' do
        @form_purchase.phone_number = ''
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号にハイフンが入っていると購入できない' do
        @form_purchase.phone_number = '111-1111-1111'
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include 'Phone number は11字以下で入力してください'
      end
      it '電話番号が9桁以下だと購入できない' do
        @form_purchase.phone_number = '11111'
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include 'Phone number は11字以下で入力してください'
      end
      it '電話番号が12桁以上だと購入できない' do
        @form_purchase.phone_number = '1111111111111'
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include 'Phone number は11字以下で入力してください'
      end
      it '電話番号が全角数字だと購入できない' do
        @form_purchase.phone_number = '１１１１１１１１１１１'
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include 'Phone number は11字以下で入力してください'
      end
      it '電話番号が英字だと購入できない' do
        @form_purchase.phone_number = 'aaaaaaaaaaa'
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include 'Phone number は11字以下で入力してください'
      end
      it 'userと紐づいていないと購入できない' do
        @form_purchase.user_id = nil
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'itemと紐づいていないと購入できない' do
        @form_purchase.item_id = nil
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @form_purchase.token = nil
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'priceが空だと購入できない' do
        @form_purchase.price = nil
        @form_purchase.valid?
        expect(@form_purchase.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
