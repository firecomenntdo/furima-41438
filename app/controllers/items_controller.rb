class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :context, :category_id, :item_status_id,
                                 :shipping_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end

# def create
#   @prototype = Prototype.create(prototype_params)
#   if @prototype.save
#    redirect_to '/'
#   else
#     render :new, status: :unprocessable_entity
#   end
# end
