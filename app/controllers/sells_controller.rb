class SellsController < ApplicationController
  def index
    @sells = Sell.all
  end
end
