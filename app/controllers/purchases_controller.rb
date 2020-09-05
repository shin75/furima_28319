class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index,:create]
  def index
    @purchase = UserPurchase.new
    if current_user.id == @item.user_id || @item.purchase != nil
      redirect_to root_path
    end


  end

  def create
    @purchase = UserPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  private

  def purchase_params
    params.permit(:item_id, :token, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
