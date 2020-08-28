include ActionDispatch::TestProcess

FactoryBot.define do
  factory :item do
    item_name                 {"あああ"}
    description               {"いいい"}
    category_id               {1}
    status_id                 {1}
    price                     {1000}
    delivery_fee_id           {1}
    prefecture_id             {1}
    delivery_day_id           {1}
    association :user
    after(:build) do |item|
      item.image = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'ca_img_k31_01.jpg'), 'image/jpg')
     end
  end
end

