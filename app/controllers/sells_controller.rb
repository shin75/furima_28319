class SellsController < ApplicationController
  def index
    @sells = Sell.all
  end
  
  def new
    @sells = Sell.new
  end

  def show
    @sells = Sell.find(params[:id])
  end

end
