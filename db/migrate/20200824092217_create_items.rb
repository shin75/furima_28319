class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,  null:false, foreign_key: true
      t.string :item_name,             null: false,  default:""
      t.string :image,                 null: false,  default:""
      t.text   :description,           null: false  
      t.string :category_id,           null: false,  default:""
      t.string :status_id,             null: false,  default:""
      t.string :price,                 null: false,  default:""
      t.string :delivery_fee_id,       null: false,  default:""
      t.string :prefecture_id,         null: false,  default:""
      t.string :delivery_day_id,       null: false,  default:""
      t.timestamps
    end
  end
end
