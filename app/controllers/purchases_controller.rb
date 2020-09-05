class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @purchase = UserPurchase.new
    if current_user.id == @item.user_id || @item.purchase != nil
      redirect_to root_path
    end


  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = UserPurchase.new(purchase_params)
    #binding.pry
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
    Payjp.api_key = "sk_test_6484dd5c7edb115293c703d1"  # PAY.JPテスト秘密鍵
    #binding.pry
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
