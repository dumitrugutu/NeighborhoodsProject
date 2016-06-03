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

ActiveRecord::Schema.define(version: 20160603192528) do

  create_table "events", force: true do |t|
    t.integer  "group_rep_id"
    t.string   "name"
    t.string   "organizer_contact_info"
    t.datetime "event_time"
    t.boolean  "is_free",                default: true
    t.string   "location"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "events", ["group_rep_id"], name: "index_events_on_group_rep_id"

  create_table "group_reps", force: true do |t|
    t.integer  "group_id"
    t.boolean  "admin"
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "group_reps", ["email"], name: "index_group_reps_on_email", unique: true
  add_index "group_reps", ["group_id"], name: "index_group_reps_on_group_id"
  add_index "group_reps", ["reset_password_token"], name: "index_group_reps_on_reset_password_token", unique: true

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "contact_info"
    t.string   "address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "neighborhoods", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "lat"
    t.decimal  "lng"
  end

  create_table "service_areas", force: true do |t|
    t.integer  "neighborhood_id"
    t.integer  "group_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
