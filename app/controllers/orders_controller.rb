class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @form_purchase = FormPurchase.new
  end

  def create
    @form_purchase = FormPurchase.new(item_params)
    if @form_purchase.valid?
      pay_item
      @form_purchase.save
      redirect_to root_path
    else
      Rails.logger.info(@form_purchase.errors.full_messages)
      render :index, status: :unprocessable_entity
    end
  end
end

private

def set_item
  @item = Item.find(params[:item_id])
end

def item_params
  params.require(:form_purchase).permit(:address_number, :prefecture_id, :address, :block_number, :building_name, :phone_number)
        .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price)
end

def pay_item
  Payjp.api_key = 'sk_test_2e892d4e0bf43218e97d3db3'
  Payjp::Charge.create(
    amount: @form_purchase.price, # 商品の値段
    card: @form_purchase.token, # カードトークン
    currency: 'jpy' # 通貨の種類（日本円）
  )
end
