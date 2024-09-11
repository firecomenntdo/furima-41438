class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @form_purchase = FormPurchase.new
  end

  def create
    @form_purchase = FormPurchase.new(item_params)
    if @form_purchase.valid?
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
  params.require(:form_purchase).permit(:address_number, :prefecture_id, :address, :block_number, :building_name, :phone_number, :purchase_history_id,
                                        :user, :item).merge(user: current_user, item: @item)
end
