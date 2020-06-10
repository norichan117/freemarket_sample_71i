class CreateUserCards < ActiveRecord::Migration[5.0]
  def change
    create_table :user_cards do |t|
      t.integer :user_id,            null: false, foreign_key: true
      t.string :customer_id,         null: false
      t.string :card_id,             null: false
      t.timestamps
    end
  end
end
