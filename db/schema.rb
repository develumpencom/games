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

ActiveRecord::Schema[8.0].define(version: 2025_03_02_212442) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "bgg_id", null: false
    t.string "bgg_type", null: false
    t.string "name", null: false
    t.string "thumbnail"
    t.text "description"
    t.string "yearpublished"
    t.string "minplayers"
    t.string "maxplayers"
    t.string "playingtime"
    t.string "minplaytime"
    t.string "maxplaytime"
    t.string "minage"
    t.jsonb "categories"
    t.jsonb "mechanics"
    t.jsonb "expansions"
    t.jsonb "designers"
    t.jsonb "artists"
    t.jsonb "publishers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "list_id", null: false
    t.string "listable_type", null: false
    t.bigint "listable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_listings_on_list_id"
    t.index ["listable_type", "listable_id"], name: "index_listings_on_listable"
  end

  create_table "lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.integer "breakable_toys_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  create_table "users_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_users_sessions_on_user_id"
  end

  add_foreign_key "listings", "lists"
  add_foreign_key "lists", "users"
  add_foreign_key "users_sessions", "users"
end
