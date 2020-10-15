class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :username_confirmation
      t.string :password_digest
      t.string :password_digest_confirmation
      t.string :email_address
      t.string :first_name
      t.string :last_name
      t.integer :uid
      t.boolean :password_required
      #t.string :image
      t.string :url
      t.timestamps
    end
  end
end
