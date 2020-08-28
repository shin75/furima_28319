class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to :user
  has_one_attached :image

  with_options presence:true do
    validates :image
    validates :description
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
end
validates :delivery_day_id, presence: {message: "Delivery_day can't be blank"}
validates :item_name, presence: {message: "Name can't be blank"}
validates :price,numericality: {greater_than_or_equal_to: 300,less_than: 9999999}
end