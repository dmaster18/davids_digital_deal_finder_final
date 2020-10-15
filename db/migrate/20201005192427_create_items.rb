class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.integer :sale_price
      t.integer :original_price
      t.integer :sale_percentage
      t.string :link
      t.string :retailer
      t.string :source
      t.boolean :ordered

      t.timestamps
    end
  end
end
