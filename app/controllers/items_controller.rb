class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  def create
    @items = Item.new(item_params)
  end

  private

  def article_params
    params.require(:item).permit(:title,:text,:items_id)
  end

end
