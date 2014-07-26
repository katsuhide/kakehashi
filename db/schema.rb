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

ActiveRecord::Schema.define(version: 20140506035226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "day_trends", force: true do |t|
    t.integer  "keyword_id"
    t.integer  "total_count"
    t.date     "base_date"
    t.integer  "total_rank"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "day_count"
    t.integer  "week_count"
    t.integer  "month_count"
    t.integer  "day_rank"
    t.integer  "week_rank"
    t.integer  "month_rank"
  end

  add_index "day_trends", ["keyword_id"], name: "index_day_trends_on_keyword_id", using: :btree

  create_table "keywords", force: true do |t|
    t.string   "tag_type"
    t.string   "tag"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
  end

  create_table "last_executes", force: true do |t|
    t.datetime "executed_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sakes", force: true do |t|
    t.integer  "keyword_id"
    t.string   "land_of_origin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sakes", ["keyword_id"], name: "index_sakes_on_keyword_id", using: :btree

  create_table "search_conditions", force: true do |t|
    t.integer  "keyword_id"
    t.string   "search_word"
    t.decimal  "since_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "search_conditions", ["keyword_id"], name: "index_search_conditions_on_keyword_id", using: :btree

  create_table "traditionals", force: true do |t|
    t.integer  "keyword_id"
    t.string   "land_of_origin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "traditionals", ["keyword_id"], name: "index_traditionals_on_keyword_id", using: :btree

  create_table "trends", force: true do |t|
    t.integer  "keyword_id"
    t.integer  "count"
    t.datetime "search_datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trends", ["keyword_id"], name: "index_trends_on_keyword_id", using: :btree

end
