

ActiveRecord::Schema.define(version: 2019_05_20_213649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "depts", force: :cascade do |t|
    t.string "business"
    t.string "type"
    t.string "phone"
    t.string "email"
    t.string "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "item"
    t.string "price"
    t.string "description"
    t.string "reviews"
    t.bigint "depts_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product"
    t.index ["depts_id"], name: "index_items_on_depts_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "body"
    t.string "author"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_reviews_on_item_id"
  end

  add_foreign_key "items", "depts", column: "depts_id"
  add_foreign_key "reviews", "items"
end
