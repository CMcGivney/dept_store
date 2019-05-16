# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_16_145031) do

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
