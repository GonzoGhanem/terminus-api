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

ActiveRecord::Schema.define(version: 20160509160953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bondis", force: true do |t|
    t.string   "name"
    t.datetime "departure"
    t.datetime "arrival"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "origin"
    t.integer  "destination"
    t.boolean  "days",        default: [], array: true
  end

  create_table "destinations", force: true do |t|
    t.string  "name"
    t.integer "code"
  end

  create_table "requests", force: true do |t|
    t.string   "text"
    t.string   "email"
    t.date     "request_date"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
