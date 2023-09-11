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

ActiveRecord::Schema[7.0].define(version: 2023_09_10_095954) do
  create_table "bookings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "football_field_id", null: false
    t.bigint "user_id", null: false
    t.datetime "time_booking_start"
    t.datetime "time_booking_end"
    t.integer "status", limit: 1
    t.bigint "voucher_id", null: false
    t.decimal "total_price", precision: 15, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["football_field_id"], name: "index_bookings_on_football_field_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
    t.index ["voucher_id"], name: "index_bookings_on_voucher_id"
  end

  create_table "favorites", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "football_field_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["football_field_id"], name: "index_favorites_on_football_field_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "football_field_schedules", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "football_field_id", null: false
    t.bigint "schedule_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["football_field_id"], name: "index_football_field_schedules_on_football_field_id"
    t.index ["schedule_id"], name: "index_football_field_schedules_on_schedule_id"
  end

  create_table "football_fields", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "capacity", limit: 1
    t.bigint "type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_id"], name: "index_football_fields_on_type_id"
  end

  create_table "ratings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "football_field_id", null: false
    t.bigint "user_id", null: false
    t.integer "rating", limit: 1
    t.string "comment"
    t.integer "status", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["football_field_id"], name: "index_ratings_on_football_field_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "reply_ratings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "rating_id", null: false
    t.bigint "user_id", null: false
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rating_id"], name: "index_reply_ratings_on_rating_id"
    t.index ["user_id"], name: "index_reply_ratings_on_user_id"
  end

  create_table "schedules", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.time "time_start"
    t.time "time_end"
    t.decimal "price", precision: 15, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.integer "gender"
    t.string "phone"
    t.string "address"
    t.integer "role", default: 0
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vouchers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code"
    t.integer "discount", limit: 1
    t.datetime "time_start"
    t.datetime "time_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "football_fields"
  add_foreign_key "bookings", "users"
  add_foreign_key "bookings", "vouchers"
  add_foreign_key "favorites", "football_fields"
  add_foreign_key "favorites", "users"
  add_foreign_key "football_field_schedules", "football_fields"
  add_foreign_key "football_field_schedules", "schedules"
  add_foreign_key "football_fields", "types"
  add_foreign_key "ratings", "football_fields"
  add_foreign_key "ratings", "users"
  add_foreign_key "reply_ratings", "ratings"
  add_foreign_key "reply_ratings", "users"
end
