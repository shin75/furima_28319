class UserPurchase

  include ActiveModel::Model
  attr_accessor :purchase_id, :token,:item_id,:user_id, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number

YUBIN = /\A\d{3}[-]\d{4}\z/
PHONE = /\A\d{11}\z/
    with_options presence:true do
    validates :postal_code, format: {with: YUBIN}
    validates :prefecture
    validates :token
    validates :city
    validates :house_number
    validates :phone_number, format: {with: PHONE}
    end
    
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name,phone_number: phone_number, purchase_id: purchase.id)
  end
end
