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

ActiveRecord::Schema[7.0].define(version: 2023_09_08_074737) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.date "date"
    t.string "tournament"
    t.string "location"
    t.string "round"
    t.integer "result", default: 0
    t.integer "opponent_result"
    t.bigint "team_id"
    t.bigint "opponent_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["opponent_team_id"], name: "index_games_on_opponent_team_id"
    t.index ["team_id"], name: "index_games_on_team_id"
  end

  create_table "participations", force: :cascade do |t|
    t.string "number"
    t.bigint "player_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_participations_on_game_id"
    t.index ["player_id"], name: "index_participations_on_player_id"
  end

  create_table "player_actions", force: :cascade do |t|
    t.string "kind"
    t.bigint "player_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "position"
    t.string "result"
    t.time "time"
    t.index ["game_id"], name: "index_player_actions_on_game_id"
    t.index ["player_id"], name: "index_player_actions_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "nationality"
    t.string "gender"
    t.text "description"
    t.string "position"
    t.string "handedness"
    t.boolean "available"
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "birthdate"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "country"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "teams"
  add_foreign_key "games", "teams", column: "opponent_team_id"
  add_foreign_key "participations", "games"
  add_foreign_key "participations", "players"
  add_foreign_key "player_actions", "games"
  add_foreign_key "player_actions", "players"
  add_foreign_key "players", "teams"
  add_foreign_key "teams", "users"
end
