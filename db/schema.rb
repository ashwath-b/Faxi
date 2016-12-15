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

ActiveRecord::Schema.define(version: 20161215101829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabs", force: true do |t|
    t.boolean  "pink_taxi",        default: false
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "currently_booked", default: false
    t.string   "city"
    t.text     "address"
    t.string   "plate_num"
    t.string   "model"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rides", force: true do |t|
    t.integer  "cab_id"
    t.float    "start_lat"
    t.float    "start_lng"
    t.float    "end_lat"
    t.float    "end_lng"
    t.float    "rent_amount"
    t.boolean  "in_progress", default: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
