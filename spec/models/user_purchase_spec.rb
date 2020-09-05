require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe '#create' do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @purchase = FactoryBot.build(:user_purchase, user_id:@user.id)
    end

  context '購入がうまくいくとき'
    it "郵便番号・都道府県・市区町村・番地・電話番号が必須であること" do
    expect(@purchase).to be_valid
  end

  context '購入がうまく行かないとき'
  it "郵便番号が必須であること" do
    @purchase.postal_code = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
    
  end
  it "都道府県が必須であること" do
    @purchase.prefecture = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
  end
  it "市区町村が必須であること" do
    @purchase.city = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("City can't be blank")
  end
  it "番地が必須であること" do
    @purchase.house_number = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("House number can't be blank")
  end
  it "電話番号が必須であること" do
    @purchase.phone_number = nil
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
  end
  it "郵便番号にはハイフンが必須であること" do
    @purchase.postal_code = "2140001"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Postal code is invalid")
  end
  it "電話番号にはハイフンは不要で、11桁以内であること" do
    @purchase.phone_number = "0904444222222"
    @purchase.valid?
    expect(@purchase.errors.full_messages).to include("Phone number is invalid")
  end
  end
end
