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

ActiveRecord::Schema.define(version: 20150309210740) do

  create_table "competencies", force: :cascade do |t|
    t.string   "title"
    t.boolean  "added",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "points"
    t.integer  "user_id"
    t.string   "expertise"
  end

  create_table "learn_moments", force: :cascade do |t|
    t.string   "title"
    t.string   "what_was_learned"
    t.string   "what_was_done"
    t.string   "reference"
    t.integer  "competency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hours"
    t.string   "image"
    t.integer  "sprint_week"
  end

  create_table "learning_goals", force: :cascade do |t|
    t.text     "goal"
    t.integer  "competency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "goal_made",     default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 80
    t.string   "username",        limit: 50
    t.string   "email",                      default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "mobile"
    t.integer  "student_number"
    t.string   "avatar"
  end

end
