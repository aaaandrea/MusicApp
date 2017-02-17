# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170217011555) do

  create_table "albums", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "band_id",    null: false
    t.integer  "year",       null: false
    t.boolean  "live",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "albums", ["band_id"], name: "index_albums_on_band_id"
  add_index "albums", ["live"], name: "index_albums_on_live"
  add_index "albums", ["name"], name: "index_albums_on_name"
  add_index "albums", ["year"], name: "index_albums_on_year"

  create_table "bands", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bands", ["name"], name: "index_bands_on_name"

  create_table "tracks", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "album_id",   null: false
    t.integer  "ord",        null: false
    t.boolean  "bonus"
    t.text     "lyrics"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tracks", ["album_id"], name: "index_tracks_on_album_id"
  add_index "tracks", ["name"], name: "index_tracks_on_name"
  add_index "tracks", ["ord"], name: "index_tracks_on_ord"

  create_table "users", force: :cascade do |t|
    t.string   "email_address",                    null: false
    t.string   "password",                         null: false
    t.string   "session_token",                    null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "activated",        default: false
    t.string   "activation_token"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", unique: true
  add_index "users", ["email_address"], name: "index_users_on_email_address"
  add_index "users", ["session_token"], name: "index_users_on_session_token"

end
