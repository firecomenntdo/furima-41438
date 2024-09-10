class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.create(item_params)
  end
end

private

def item_params
  params.require(:form_purchase).permit(:address_number, :prefecture_id, :address, :block_number, :building_name, :phone_number, :purchase_history,
                                        :user, :item)
end
