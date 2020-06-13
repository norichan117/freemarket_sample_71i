class CreateTradings < ActiveRecord::Migration[5.0]
  def change
    create_table :tradings do |t|
      t.integer :user_id,             foreign_key: true
      t.string :trading_family_name
      t.string :trading_first_name
      t.string :trading_family_name_kana
      t.string :trading_first_name_kana
      t.string :trading_yubin_bango
      t.string :trading_todofuken
      t.string :trading_shichoson
      t.string :trading_banchi
      t.string :trading_building
      t.string :trading_tel_no
      t.string :trading_card_id
      t.string :trading_customer_id
      t.timestamps
    end
  end
end
