class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    if user_signed_in? == false
      redirect_to new_user_session_url
    elsif @item.purchase_history.present? || (user_signed_in? && @item.user == current_user)
      redirect_to items_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      @form_purchase = FormPurchase.new
    end
  end

  def create
    @form_purchase = FormPurchase.new(item_params)
    if @form_purchase.valid?
      pay_item
      @form_purchase.save
      redirect_to root_path
    else
      Rails.logger.info(@form_purchase.errors.full_messages)
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
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
        .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
end

def pay_item
  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  Payjp::Charge.create(
    amount: @item.price, # 商品の値段
    card: @form_purchase.token, # カードトークン
    currency: 'jpy' # 通貨の種類（日本円）
  )
end
