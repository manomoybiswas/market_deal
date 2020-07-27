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

ActiveRecord::Schema.define(version: 2020_07_27_212028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "address_line_1", limit: 100, null: false
    t.string "address_line_2", limit: 100
    t.string "city", limit: 30, null: false
    t.string "district", limit: 30, null: false
    t.string "state", limit: 30, null: false
    t.string "landmark", limit: 50
    t.bigint "pin_code", null: false
    t.string "type", limit: 10, null: false
    t.boolean "current", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "available_quantities", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "unit_id", null: false
    t.integer "packet_size", null: false
    t.integer "discount_percent", null: false
    t.decimal "discount_amount", precision: 5, scale: 2, null: false
    t.decimal "retail_price", precision: 7, scale: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_available_quantities_on_product_id"
    t.index ["unit_id"], name: "index_available_quantities_on_unit_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "product_id", null: false
    t.bigint "available_quantities_id", null: false
    t.integer "quantity", limit: 2, null: false
    t.decimal "discount", precision: 5, scale: 2, null: false
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["available_quantities_id"], name: "index_cart_items_on_available_quantities_id"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "status", limit: 50, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", limit: 50, null: false
    t.text "category_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "delivery_addresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "order_id", null: false
    t.string "address_line_1", limit: 100, null: false
    t.string "address_line_2", limit: 100
    t.string "city", limit: 30, null: false
    t.string "district", limit: 30, null: false
    t.string "state", limit: 30, null: false
    t.string "landmark", limit: 50
    t.bigint "pin_code", null: false
    t.string "type", limit: 10, null: false
    t.string "mobile", limit: 13, null: false
    t.string "alt_mobile", limit: 13
    t.string "email", limit: 50, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_delivery_addresses_on_order_id"
    t.index ["user_id"], name: "index_delivery_addresses_on_user_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.bigint "available_quantities_id", null: false
    t.integer "quantity", limit: 2, null: false
    t.decimal "price_per_unit", precision: 7, scale: 2, null: false
    t.decimal "discount", precision: 5, scale: 2, null: false
    t.decimal "total_price", precision: 10, scale: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["available_quantities_id"], name: "index_order_items_on_available_quantities_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "sub_total", precision: 10, scale: 2, null: false
    t.integer "discount_percent", null: false
    t.decimal "discount_amount", precision: 5, scale: 2, null: false
    t.decimal "gst_tax", precision: 5, scale: 2, null: false
    t.decimal "shipping_charge", precision: 4, scale: 2, null: false
    t.decimal "total", precision: 10, scale: 2, null: false
    t.string "promocode", limit: 14
    t.decimal "promo_discount", precision: 5, scale: 2
    t.decimal "grand_total", precision: 10, scale: 2, null: false
    t.string "status", limit: 15, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_product_categories_on_category_id"
    t.index ["product_id"], name: "index_product_categories_on_product_id"
  end

  create_table "product_pictures", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "picture", limit: 50, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_pictures_on_product_id"
  end

  create_table "product_stocks", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "unit_id", null: false
    t.bigint "quantity", null: false
    t.decimal "per_unit_purchase_price", precision: 6, scale: 2, null: false
    t.decimal "per_unit_retail_price", precision: 6, scale: 2, null: false
    t.decimal "total_purchase_price", precision: 10, scale: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_stocks_on_product_id"
    t.index ["unit_id"], name: "index_product_stocks_on_unit_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "unit_id", null: false
    t.string "title", null: false
    t.string "summary", limit: 255, null: false
    t.string "type", null: false
    t.bigint "total_quantity", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["unit_id"], name: "index_products_on_unit_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "title", limit: 10, null: false
    t.string "summary", limit: 255, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "username", null: false
    t.string "email", limit: 50, null: false
    t.string "mobile", limit: 13, null: false
    t.string "alt_mobile", limit: 13
    t.string "password_digest", limit: 255, null: false
    t.string "auth_type", limit: 50, null: false
    t.bigint "uid"
    t.boolean "vendor", default: false
    t.boolean "admin", default: false
    t.string "profile_name", limit: 35
    t.string "avater", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "available_quantities", "products"
  add_foreign_key "available_quantities", "units"
  add_foreign_key "cart_items", "available_quantities", column: "available_quantities_id"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "delivery_addresses", "orders"
  add_foreign_key "delivery_addresses", "users"
  add_foreign_key "order_items", "available_quantities", column: "available_quantities_id"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "product_categories", "categories"
  add_foreign_key "product_categories", "products"
  add_foreign_key "product_pictures", "products"
  add_foreign_key "product_stocks", "products"
  add_foreign_key "product_stocks", "units"
  add_foreign_key "products", "units"
  add_foreign_key "products", "users"
end
