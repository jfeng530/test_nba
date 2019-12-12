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

ActiveRecord::Schema.define(version: 2019_12_11_222210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "player_stats", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "team_season_id", null: false
    t.integer "ast"
    t.integer "blk"
    t.integer "dreb"
    t.integer "fg3a"
    t.integer "fg3m"
    t.integer "fga"
    t.integer "fgm"
    t.integer "fta"
    t.integer "ftm"
    t.integer "oreb"
    t.integer "pf"
    t.integer "pts"
    t.integer "reb"
    t.integer "stl"
    t.integer "turnover"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_stats_on_player_id"
    t.index ["team_season_id"], name: "index_player_stats_on_team_season_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "position"
    t.integer "height_feet"
    t.integer "height_inches"
    t.integer "weight_pounds"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_seasons", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "season_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["season_id"], name: "index_team_seasons_on_season_id"
    t.index ["team_id"], name: "index_team_seasons_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "abbreviation"
    t.string "city"
    t.string "conference"
    t.string "division"
    t.string "full_name"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "player_stats", "players"
  add_foreign_key "player_stats", "team_seasons"
  add_foreign_key "team_seasons", "seasons"
  add_foreign_key "team_seasons", "teams"
end
