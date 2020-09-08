class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy, :update]
  before_action :move_to_index, except: [:index, :show, :update]

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

  def update
    @item.update(item_params)
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else 
      redirect_to :back and return true
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name,:description,:image,:category_id, :status_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price).merge(user_id:current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
 end
end