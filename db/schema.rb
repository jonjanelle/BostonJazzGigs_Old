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

ActiveRecord::Schema.define(version: 20170621154556) do

  create_table "band_musicians", force: :cascade do |t|
    t.integer "band_id"
    t.integer "musician_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_band_musicians_on_band_id"
    t.index ["musician_id"], name: "index_band_musicians_on_musician_id"
  end

  create_table "bands", force: :cascade do |t|
    t.string "name", null: false
    t.string "genre", null: false
    t.text "description", null: false
    t.string "email", null: false
    t.text "url"
    t.binary "image"
    t.binary "songdemo1"
    t.string "songdemo1_title"
    t.binary "songdemo2"
    t.string "songdemo2_title"
    t.string "zipcode"
    t.integer "radius"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musicians", force: :cascade do |t|
    t.string "firstname", limit: 50, null: false
    t.string "lastname", limit: 50, null: false
    t.string "instrument", null: false
    t.string "instrument2"
    t.string "image"
    t.text "bio"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_musicians_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname", limit: 50, null: false
    t.string "lastname", limit: 50, null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "user_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
