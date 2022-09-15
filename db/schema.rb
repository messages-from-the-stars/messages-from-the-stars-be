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

ActiveRecord::Schema.define(version: 2022_09_15_003310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.integer "satellite_id"
    t.float "start_lat"
    t.float "start_lng"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "satellites", force: :cascade do |t|
    t.integer "norad_id"
  end

  create_table "user_messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "message_id"
    t.integer "user_role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_user_messages_on_message_id"
    t.index ["user_id"], name: "index_user_messages_on_user_id"
  end

  create_table "user_satellites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "satellite_id"
    t.index ["satellite_id"], name: "index_user_satellites_on_satellite_id"
    t.index ["user_id"], name: "index_user_satellites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_messages", "messages"
  add_foreign_key "user_messages", "users"
  add_foreign_key "user_satellites", "satellites"
  add_foreign_key "user_satellites", "users"
end
