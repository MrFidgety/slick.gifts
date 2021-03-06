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

ActiveRecord::Schema.define(version: 20161210011111) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interests", force: :cascade do |t|
    t.text     "name"
    t.text     "comment"
    t.text     "image"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "interests", ["user_id"], name: "index_interests_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.text     "name"
    t.text     "comment"
    t.text     "link"
    t.text     "code"
    t.text     "location"
    t.text     "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "purchases", force: :cascade do |t|
    t.text     "comment"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.integer  "status",     default: 0
    t.integer  "want_id"
  end

  add_index "purchases", ["user_id"], name: "index_purchases_on_user_id", using: :btree
  add_index "purchases", ["want_id"], name: "index_purchases_on_want_id", using: :btree

  create_table "styles", force: :cascade do |t|
    t.text     "name"
    t.text     "comment"
    t.text     "size"
    t.text     "image"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "styles", ["user_id"], name: "index_styles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: ""
    t.string   "provider"
    t.string   "uid"
    t.datetime "remember_created_at"
    t.string   "remember_token"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "image"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", using: :btree

  create_table "wants", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "wanted_id"
    t.string   "wanted_type"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "archived",    default: false
  end

  add_index "wants", ["user_id"], name: "index_wants_on_user_id", using: :btree
  add_index "wants", ["wanted_id", "wanted_type"], name: "index_wants_on_wanted_id_and_wanted_type", using: :btree

  add_foreign_key "interests", "users"
  add_foreign_key "items", "users"
  add_foreign_key "purchases", "users"
  add_foreign_key "purchases", "wants"
  add_foreign_key "styles", "users"
  add_foreign_key "wants", "users"
end
