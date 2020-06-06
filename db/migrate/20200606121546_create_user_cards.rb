class CreateUserCards < ActiveRecord::Migration[5.0]
  def change
    create_table :user_cards do |t|

      t.timestamps
    end
  end
end
