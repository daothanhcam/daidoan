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

ActiveRecord::Schema.define(version: 20160126121816) do

  create_table "banners", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "actived"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "banners", ["post_id"], name: "index_banners_on_post_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "post_id",    limit: 4
    t.boolean  "hidden"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "converations", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "converations", ["user_id"], name: "index_converations_on_user_id", using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "feedbacks", ["user_id"], name: "index_feedbacks_on_user_id", using: :btree

  create_table "followings", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "post_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "followings", ["post_id"], name: "index_followings_on_post_id", using: :btree
  add_index "followings", ["user_id"], name: "index_followings_on_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.integer  "banner_id",  limit: 4
    t.string   "url",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "images", ["banner_id"], name: "index_images_on_banner_id", using: :btree
  add_index "images", ["post_id"], name: "index_images_on_post_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "converation_id", limit: 4
    t.integer  "user_id",        limit: 4
    t.text     "content",        limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "messages", ["converation_id"], name: "index_messages_on_converation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "type",       limit: 255
    t.text     "content",    limit: 65535
    t.integer  "view",       limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "banners", "posts"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "converations", "users"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "followings", "posts"
  add_foreign_key "followings", "users"
  add_foreign_key "images", "banners"
  add_foreign_key "images", "posts"
  add_foreign_key "messages", "converations"
  add_foreign_key "messages", "users"
end