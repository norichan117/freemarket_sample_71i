class CreateDeliverAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :deliver_addresses do |t|
      t.integer :user_id,             foreign_key: true
      t.string :deliver_family_name
      t.string :deliver_first_name
      t.string :deliver_family_name_kana
      t.string :deliver_first_name_kana
      t.string :deliver_yubin_bango
      t.string :deliver_todofuken
      t.string :deliver_shichoson
      t.string :deliver_banchi
      t.string :deliver_building
      t.string :deliver_tel_no
      t.timestamps
    end
  end
end
