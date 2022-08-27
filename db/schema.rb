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

ActiveRecord::Schema[7.0].define(version: 2022_08_27_195608) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "start_rent"
    t.date "end_rent"
    t.bigint "user_id", null: false
    t.bigint "heros_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["heros_id"], name: "index_bookings_on_heros_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "overview"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_heros_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "heros", column: "heros_id"
  add_foreign_key "bookings", "users"
  add_foreign_key "heros", "users"
end