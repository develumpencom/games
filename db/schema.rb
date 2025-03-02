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

ActiveRecord::Schema[8.0].define(version: 2025_03_02_191559) do
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
end
