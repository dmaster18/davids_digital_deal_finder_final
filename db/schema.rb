# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_05_192714) do

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "sale_price"
    t.integer "original_price"
    t.integer "sale_percentage"
    t.string "link"
    t.string "retailer"
    t.string "source"
    t.boolean "ordered"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "item_id"
    t.integer "user_id"
    t.string "title"
    t.integer "rating"
    t.string "description"
    t.string "item_and_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "username_confirmation"
    t.string "password_digest"
    t.string "password_digest_confirmation"
    t.string "email_address"
    t.string "first_name"
    t.string "last_name"
    t.integer "uid"
    t.boolean "password_required"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wishlist_items", force: :cascade do |t|
    t.integer "wishlist_id"
    t.integer "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
