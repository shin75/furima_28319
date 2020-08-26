class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,             null: false,  default:""
      t.string :image,            null: false,  default:""
      t.text   :description,      null: false  
      t.string :category,         null: false,  default:""
      t.string :status,           null: false,  default:""
      t.string :price,            null: false,  default:""
      t.string :delivery_fee,     null: false,  default:""
      t.string :prefecture,       null: false,  default:""
      t.string :delivery_day,     null: false,  default:""
      t.timestamps
    end
  end
end
