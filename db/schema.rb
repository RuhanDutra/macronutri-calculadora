# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_17_141603) do

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "verified", default: false
    t.integer "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nutritional_contents", force: :cascade do |t|
    t.integer "portion"
    t.integer "unit"
    t.float "unit_g_multiplier"
    t.integer "calories"
    t.float "calcium"
    t.float "carbohydrates"
    t.float "cholesterol"
    t.float "fat"
    t.float "fiber"
    t.float "iron"
    t.float "monounsaturated_fat"
    t.float "polyunsaturated_fat"
    t.float "potassium"
    t.float "protein"
    t.float "saturated_fat"
    t.float "sodium"
    t.float "sugar"
    t.float "trans_fat"
    t.float "vitamin_a"
    t.float "vitamin_c"
    t.integer "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_nutritional_contents_on_item_id"
  end

  add_foreign_key "nutritional_contents", "items"
end
