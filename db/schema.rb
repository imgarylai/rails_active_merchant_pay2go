# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151129011831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "hstore"

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.uuid     "order_id"
    t.decimal  "unit_price", default: 0.0
    t.integer  "quantity",   default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "orders", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.hstore   "params"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "trade_number"
  end

  add_index "orders", ["trade_number"], name: "index_orders_on_trade_number", unique: true, using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "products"
end
