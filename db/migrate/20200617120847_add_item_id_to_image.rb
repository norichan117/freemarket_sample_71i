class AddItemIdToImage < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :item_id, :integer
  end
end
