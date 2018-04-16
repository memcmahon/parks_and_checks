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

ActiveRecord::Schema.define(version: 20180416210710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gifts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "image_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_gifts_on_image_id"
    t.index ["user_id"], name: "index_gifts_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "park"
    t.string "park_url"
    t.string "credit"
    t.string "alt_text"
    t.string "title"
    t.string "caption"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nps_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  add_foreign_key "gifts", "images"
  add_foreign_key "gifts", "users"
end
