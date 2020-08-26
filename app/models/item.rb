class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  
  with_options presence:true do
    validates :name
    validates :image
    validates :descrioption
    validates :category
    validates :status
    validates :price
    validates :delivery_fee
    validates :prefecture
    validates :delivery_day
end
end