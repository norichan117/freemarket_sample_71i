class ChangeDateItemIdToImages < ActiveRecord::Migration[5.0]
  def change
    change_column :images, :item_id, :integer, foreign_key: true
  end
end
