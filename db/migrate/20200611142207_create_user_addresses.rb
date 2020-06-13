class CreateUserAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_addresses do |t|
      t.integer :user_id,             foreign_key: true
      t.string :user_yubin_bango
      t.string :user_todofuken
      t.string :user_shichoson
      t.string :user_banchi
      t.string :user_building
      t.timestamps
    end
  end
end
