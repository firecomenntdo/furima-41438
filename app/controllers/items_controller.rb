class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit, :update, :destroy]
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
      puts @item.errors.full_messages
    end
  end

  def destroy
    item = Item.find(params[:id])
    if user_signed_in? && item.user == current_user
      item.destroy
      redirect_to root_path
    else
      move_to_index
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :context, :category_id, :item_status_id,
                                 :shipping_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    return if user_signed_in? && @item.user == current_user

    redirect_to action: :index
  end
end
