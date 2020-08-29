require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

describe '出品登録' do
  context '出品登録がうまくいくとき' do
    it "すべて入力すれば登録できる" do
      expect(@item).to be_valid
    end

    it "画像が最低1枚あれば登録できる" do
      @item.image = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'ca_img_k31_01.jpg'), 'image/jpg')
      expect(@item).to be_valid
    end
  end

  context '出品登録がうまく行かないとき'
  it "画像は1枚必須であること" do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it "商品名が必須であること" do
    @item.item_name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Item name Name can't be blank")
  end

  it "商品の説明が必須であること" do
    @item.description = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end

    it "カテゴリーの情報が必須であること" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "商品の状態についての情報が必須であること" do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it "発送元の地域についての情報が必須であること" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "発送までの日数についての情報が必須であること" do
      @item.delivery_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day Delivery_day can't be blank")
    end

    it "価格についての情報が必須であること" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "価格の範囲が、¥300より小さい値の場合出品できないこと" do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "価格の範囲が、¥9,999,999より大きい値の場合出品できないこと" do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end
  end
  end