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

ActiveRecord::Schema.define(version: 20151106135347) do

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "read_at"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "note_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "group_id"
    t.text     "content"
    t.integer  "readflag"
  end

  create_table "notes", force: :cascade do |t|
    t.text     "content"
    t.string   "image",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.text     "email"
    t.integer  "sex"
    t.text     "major"
    t.date     "birthday"
    t.string   "password",            limit: 255
    t.text     "university"
    t.string   "national",            limit: 255
    t.string   "city",                limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest",     limit: 255
    t.string   "remember_token",      limit: 255
    t.string   "encrypted_password",  limit: 255, default: "", null: false
    t.datetime "remember_created_at"
    t.string   "image",               limit: 255
    t.string   "uid",                 limit: 255
    t.string   "provider",            limit: 255
    t.string   "to_national",         limit: 255
    t.text     "to_university"
    t.string   "user_past"
    t.string   "user_why"
    t.string   "user_finish"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
