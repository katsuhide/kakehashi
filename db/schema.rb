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

ActiveRecord::Schema.define(version: 20140326174400) do

  create_table "days", force: true do |t|
    t.string   "tag_type"
    t.string   "tag"
    t.string   "name"
    t.integer  "count"
    t.date     "base_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keywords", force: true do |t|
    t.string   "tag_type"
    t.string   "tag"
    t.string   "keyword"
    t.string   "name"
    t.string   "land_of_origin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trends", force: true do |t|
    t.integer  "keyword_id"
    t.integer  "count"
    t.datetime "search_datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trends", ["keyword_id"], name: "index_trends_on_keyword_id"

end