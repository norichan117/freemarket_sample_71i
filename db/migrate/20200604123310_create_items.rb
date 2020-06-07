class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :user_id,      foreign_key: true
      t.string :item_name 
      t.string :item_info
      t.integer :category_id,  foreign_key: true
      t.integer :brand_id,     foreign_key: true
      t.string :condition
      t.string :postage_burden
      t.string :shipping_area
      t.string :days_to_ship
      t.integer :price
      t.integer :trading_id,   foreign_key: true,  null:true
      t.timestamps
    end
  end
end
