class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  def index
    @items = Item.all.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
  end

  private

  def item_params
    params.require(:item).permit(:item_name,:description,:image,:category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price).merge(user_id:current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
