class CreateWishlistItems < ActiveRecord::Migration[6.0]
  def change
    create_table :wishlist_items do |t|
      t.integer :wishlist_id
      t.integer :item_id

      t.timestamps
    end
  end
end
