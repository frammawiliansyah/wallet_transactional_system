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

ActiveRecord::Schema[7.2].define(version: 2025_03_14_203944) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_members_on_team_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.bigint "wallet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
    t.index ["wallet_id"], name: "index_teams_on_wallet_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "code", null: false
    t.decimal "amount", precision: 15, scale: 2, default: "0.0", null: false
    t.bigint "source_wallet_id"
    t.bigint "target_wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_transactions_on_code", unique: true
    t.index ["source_wallet_id", "target_wallet_id"], name: "index_transactions_on_source_wallet_id_and_target_wallet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "email_address", null: false
    t.string "password", null: false
    t.bigint "wallet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
    t.index ["wallet_id"], name: "index_users_on_wallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.string "address", null: false
    t.decimal "balance", precision: 15, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_wallets_on_address", unique: true
  end

  add_foreign_key "members", "teams"
  add_foreign_key "members", "users"
  add_foreign_key "teams", "users"
  add_foreign_key "teams", "wallets"
  add_foreign_key "users", "wallets"
end
