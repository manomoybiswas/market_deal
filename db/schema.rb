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

ActiveRecord::Schema.define(version: 2020_06_21_170550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "product_categories", force: :cascade do |t|
    t.string "category_name", limit: 50, null: false
    t.text "category_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_pictures", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_pictures_on_product_id"
  end

  create_table "product_quantities", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "quantity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_quantities_on_product_id"
    t.index ["quantity_id"], name: "index_product_quantities_on_quantity_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name", null: false
    t.bigint "product_category_id", null: false
    t.bigint "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "quantities", force: :cascade do |t|
    t.bigint "quantity_size", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "unit", null: false
    t.bigint "product_id", null: false
    t.index ["product_id"], name: "index_quantities_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "email", limit: 50, null: false
    t.string "mobile", limit: 13, null: false
    t.string "password_digest", limit: 255, null: false
    t.boolean "admin", default: false
    t.string "avater", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "product_pictures", "products"
  add_foreign_key "product_quantities", "products"
  add_foreign_key "product_quantities", "quantities"
  add_foreign_key "products", "product_categories"
  add_foreign_key "quantities", "products"
end
