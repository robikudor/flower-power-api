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

ActiveRecord::Schema.define(version: 2020_09_21_080819) do

  create_table "flower_orders", force: :cascade do |t|
    t.integer "flower_id"
    t.integer "order_id"
  end

  create_table "flowers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image"
    t.integer "price"
    t.integer "color"
    t.integer "occasion"
    t.integer "form"
    t.integer "ordered_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "total_price"
    t.boolean "completed"
    t.string "delivery_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
