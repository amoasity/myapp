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

ActiveRecord::Schema[7.0].define(version: 2022_10_22_040422) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "first_schedules", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.integer "month"
    t.integer "fir"
    t.integer "sec"
    t.integer "thi"
    t.integer "fou"
    t.integer "fif"
    t.integer "six"
    t.integer "sev"
    t.integer "eig"
    t.integer "nin"
    t.integer "ten"
    t.integer "ele"
    t.integer "twe"
    t.integer "ten_thi"
    t.integer "ten_fou"
    t.integer "ten_fif"
    t.integer "ten_six"
    t.integer "ten_sev"
    t.integer "ten_eig"
    t.integer "ten_nin"
    t.integer "twentieth"
    t.integer "twe_fir"
    t.integer "twe_sec"
    t.integer "twe_thi"
    t.integer "twe_fou"
    t.integer "twe_fif"
    t.integer "twe_six"
    t.integer "twe_sev"
    t.integer "twe_eig"
    t.integer "twe_nin"
    t.integer "thirtieth"
    t.integer "thi_fir"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
  end

  create_table "massages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "talk_room_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "second_schedules", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.integer "month"
    t.integer "fir"
    t.integer "sec"
    t.integer "thi"
    t.integer "fou"
    t.integer "fif"
    t.integer "six"
    t.integer "sev"
    t.integer "eig"
    t.integer "nin"
    t.integer "ten"
    t.integer "ele"
    t.integer "twe"
    t.integer "ten_thi"
    t.integer "ten_fou"
    t.integer "ten_fif"
    t.integer "ten_six"
    t.integer "ten_sev"
    t.integer "ten_eig"
    t.integer "ten_nin"
    t.integer "twentieth"
    t.integer "twe_fir"
    t.integer "twe_sec"
    t.integer "twe_thi"
    t.integer "twe_fou"
    t.integer "twe_fif"
    t.integer "twe_six"
    t.integer "twe_sev"
    t.integer "twe_eig"
    t.integer "twe_nin"
    t.integer "thirtieth"
    t.integer "thi_fir"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
  end

  create_table "talk_rooms", force: :cascade do |t|
    t.integer "status"
    t.integer "team_id"
    t.integer "applyer_team_id"
    t.integer "receiver_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "captain_id"
    t.integer "average_age"
    t.integer "active_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "overview"
    t.integer "power"
    t.integer "status"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
