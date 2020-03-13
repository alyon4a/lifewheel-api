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

ActiveRecord::Schema.define(version: 2020_03_11_185714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "category_scores", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "life_wheel_id", null: false
    t.integer "score"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_category_scores_on_category_id"
    t.index ["life_wheel_id"], name: "index_category_scores_on_life_wheel_id"
  end

  create_table "habit_records", force: :cascade do |t|
    t.bigint "habit_id", null: false
    t.date "yes_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["habit_id"], name: "index_habit_records_on_habit_id"
  end

  create_table "habits", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_habits_on_user_id"
  end

  create_table "life_wheels", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_life_wheels_on_user_id"
  end

  create_table "mood_records", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "mood"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_mood_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "categories", "users"
  add_foreign_key "category_scores", "categories"
  add_foreign_key "category_scores", "life_wheels"
  add_foreign_key "habit_records", "habits"
  add_foreign_key "habits", "users"
  add_foreign_key "life_wheels", "users"
  add_foreign_key "mood_records", "users"
end
