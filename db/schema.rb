# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_16_071024) do

  create_table "matches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "player1", null: false
    t.bigint "player2", null: false
    t.integer "score_player1", default: 0, null: false
    t.integer "score_player2", default: 0, null: false
    t.string "location", default: ""
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player1"], name: "index_matches_on_player1"
    t.index ["player2"], name: "index_matches_on_player2"
  end

  create_table "members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 50, default: "", null: false
    t.string "contact_number", limit: 30, default: "", null: false
    t.integer "won_matches", default: 0, null: false
    t.integer "lost_matches", default: 0, null: false
    t.integer "highest_score", default: 0, null: false
    t.integer "avg_score", default: 0, null: false
    t.integer "total_score", default: 0, null: false
    t.bigint "highest_scored_match_id"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_number"], name: "index_members_on_contact_number"
  end

end
