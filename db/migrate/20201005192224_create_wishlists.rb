class CreateWishlists < ActiveRecord::Migration[6.0]
  def change
    create_table :wishlists do |t|
      t.integer :user_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
