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

ActiveRecord::Schema[7.0].define(version: 5) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.decimal "current_balance", precision: 15, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "balances", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.decimal "balance", precision: 15, scale: 2, null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_balances_on_account_id"
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "entry_type_id", null: false
    t.bigint "account_id", null: false
    t.bigint "entry_id", null: false
    t.decimal "value", precision: 15, scale: 2, null: false
    t.decimal "estimated_value", precision: 15, scale: 2, null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.string "recurrence_time"
    t.string "recurrence_day"
    t.string "description", null: false
    t.boolean "listed", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_entries_on_account_id"
    t.index ["entry_id"], name: "index_entries_on_entry_id"
    t.index ["entry_type_id"], name: "index_entries_on_entry_type_id"
  end

  create_table "entry_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_entry_types_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "balances", "accounts"
  add_foreign_key "entries", "accounts"
  add_foreign_key "entries", "entries"
  add_foreign_key "entries", "entry_types"
end
