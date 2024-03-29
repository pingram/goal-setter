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

ActiveRecord::Schema.define(version: 20140503000359) do

  create_table "comments", force: true do |t|
    t.integer  "commentable_id",   null: false
    t.string   "commentable_type", null: false
    t.integer  "author_id",        null: false
    t.string   "body",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id"
  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id"

  create_table "goal_comments", force: true do |t|
    t.integer  "author_id",  null: false
    t.string   "body",       null: false
    t.integer  "goal_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goal_comments", ["author_id"], name: "index_goal_comments_on_author_id"
  add_index "goal_comments", ["goal_id"], name: "index_goal_comments_on_goal_id"

  create_table "goals", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.integer  "user_id",     null: false
    t.string   "privacy",     null: false
    t.string   "completed",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["user_id"], name: "index_goals_on_user_id"

  create_table "user_comments", force: true do |t|
    t.integer  "author_id",  null: false
    t.string   "body",       null: false
    t.integer  "subject_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_comments", ["author_id"], name: "index_user_comments_on_author_id"
  add_index "user_comments", ["subject_id"], name: "index_user_comments_on_subject_id"

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token"
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
