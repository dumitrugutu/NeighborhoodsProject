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

ActiveRecord::Schema.define(version: 20160425173154) do

  create_table "events", force: true do |t|
    t.integer  "group_rep_id"
    t.string   "name"
    t.string   "organizer_contact_info"
    t.datetime "event_time"
    t.boolean  "is_free",                default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "events", ["group_rep_id"], name: "index_events_on_group_rep_id"

  create_table "group_reps", force: true do |t|
    t.integer  "group_id"
    t.string   "name"
    t.string   "email"
    t.string   "string"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_reps", ["group_id"], name: "index_group_reps_on_group_id"

  create_table "groups", force: true do |t|
    t.integer  "neighborhood_id"
    t.string   "name"
    t.string   "website"
    t.string   "contact_info"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "groups", ["neighborhood_id"], name: "index_groups_on_neighborhood_id"

  create_table "neighborhoods", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
