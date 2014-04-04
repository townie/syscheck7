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

ActiveRecord::Schema.define(version: 20140404200446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: true do |t|
    t.string "street_address",           null: false
    t.string "city",                     null: false
    t.string "state",          limit: 2, null: false
    t.string "postal_code",              null: false
    t.text   "description"
  end

  add_index "buildings", ["postal_code"], name: "index_buildings_on_postal_code", using: :btree
  add_index "buildings", ["street_address"], name: "index_buildings_on_street_address", using: :btree

  create_table "owners", force: true do |t|
    t.string "first_name", null: false
    t.string "last_name",  null: false
    t.string "email",      null: false
    t.string "company"
  end

  add_index "owners", ["first_name"], name: "index_owners_on_first_name", using: :btree
  add_index "owners", ["last_name"], name: "index_owners_on_last_name", using: :btree

end
