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

ActiveRecord::Schema.define(version: 20161025012645) do

  create_table "admins", force: :cascade do |t|
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
    t.string   "name",                   limit: 255
    t.string   "surname",                limit: 255
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "customer_parcels", id: false, force: :cascade do |t|
    t.integer "id",                 limit: 4,                null: false
    t.string  "customer_parcel_id", limit: 128, default: "", null: false
    t.string  "customer_id",        limit: 128, default: "", null: false
    t.string  "parcel_id",          limit: 128, default: "", null: false
  end

  add_index "customer_parcels", ["customer_id", "parcel_id"], name: "customer_parcel", unique: true, using: :btree
  add_index "customer_parcels", ["customer_parcel_id"], name: "customer_parcel_id", unique: true, using: :btree
  add_index "customer_parcels", ["id"], name: "id", unique: true, using: :btree
  add_index "customer_parcels", ["parcel_id"], name: "customer_parcel_parcel", using: :btree

  create_table "customers", id: false, force: :cascade do |t|
    t.integer  "id",              limit: 4,                null: false
    t.string   "customer_id",     limit: 128, default: "", null: false
    t.string   "name",            limit: 128, default: "", null: false
    t.string   "surname",         limit: 128, default: "", null: false
    t.string   "email",           limit: 128, default: "", null: false
    t.string   "phone",           limit: 128, default: "", null: false
    t.string   "address",         limit: 128, default: "", null: false
    t.datetime "creation_time"
    t.datetime "modified_time"
    t.string   "province",        limit: 255
    t.string   "city",            limit: 255
    t.string   "postal_code",     limit: 255
    t.string   "tracking_number", limit: 255
  end

  add_index "customers", ["customer_id"], name: "customer_id", unique: true, using: :btree
  add_index "customers", ["id"], name: "id", unique: true, using: :btree

  create_table "drivers", id: false, force: :cascade do |t|
    t.integer  "id",             limit: 4,                null: false
    t.string   "driver_id",      limit: 128, default: "", null: false
    t.string   "name",           limit: 128, default: "", null: false
    t.string   "surname",        limit: 128, default: "", null: false
    t.string   "phone",          limit: 128, default: "", null: false
    t.string   "address",        limit: 128, default: "", null: false
    t.string   "email",          limit: 128, default: "", null: false
    t.datetime "creation_time"
    t.datetime "modified_time"
    t.string   "bank_name",      limit: 255
    t.string   "branch_code",    limit: 255
    t.string   "account_holder", limit: 255
    t.string   "account_number", limit: 255
    t.string   "account_type",   limit: 255
    t.string   "province",       limit: 255
    t.string   "city",           limit: 255
    t.string   "postal_code",    limit: 255
  end

  add_index "drivers", ["driver_id"], name: "driver_id", unique: true, using: :btree
  add_index "drivers", ["id"], name: "id", unique: true, using: :btree

  create_table "locations", id: false, force: :cascade do |t|
    t.integer  "id",              limit: 4,                null: false
    t.string   "location_id",     limit: 128, default: "", null: false
    t.string   "longitude",       limit: 128, default: "", null: false
    t.string   "latitude",        limit: 128, default: "", null: false
    t.string   "street_address",  limit: 128, default: ""
    t.string   "neighbourhood",   limit: 128, default: ""
    t.string   "city",            limit: 128, default: ""
    t.string   "region",          limit: 128, default: ""
    t.string   "country",         limit: 128, default: ""
    t.datetime "creation_time"
    t.datetime "modified_time"
    t.string   "tracking_number", limit: 255
    t.string   "tracker_id",      limit: 255
  end

  add_index "locations", ["id"], name: "id", unique: true, using: :btree
  add_index "locations", ["location_id"], name: "location_id", unique: true, using: :btree

  create_table "parcels", id: false, force: :cascade do |t|
    t.integer  "id",              limit: 4,                  null: false
    t.string   "parcel_id",       limit: 128,   default: "", null: false
    t.string   "name",            limit: 128,   default: "", null: false
    t.text     "parcel_details",  limit: 65535
    t.datetime "creation_time"
    t.datetime "modified_time"
    t.integer  "customer_id",     limit: 4
    t.string   "tracking_number", limit: 255
    t.string   "address",         limit: 255
    t.string   "city",            limit: 255
    t.string   "province",        limit: 255
    t.string   "postal_code",     limit: 255
    t.string   "tracker_id",      limit: 255
  end

  add_index "parcels", ["id"], name: "id", unique: true, using: :btree
  add_index "parcels", ["parcel_id"], name: "parcel_id", unique: true, using: :btree

  create_table "tracker_locations", id: false, force: :cascade do |t|
    t.integer "id",                  limit: 4,                null: false
    t.string  "tracker_location_id", limit: 128, default: "", null: false
    t.string  "tracker_id",          limit: 128, default: "", null: false
    t.string  "location_id",         limit: 128, default: "", null: false
  end

  add_index "tracker_locations", ["id"], name: "id", unique: true, using: :btree
  add_index "tracker_locations", ["location_id"], name: "tracker_location_location", using: :btree
  add_index "tracker_locations", ["tracker_id", "location_id"], name: "tracker_location", unique: true, using: :btree
  add_index "tracker_locations", ["tracker_location_id"], name: "tracker_location_id", unique: true, using: :btree

  create_table "tracker_parcels", id: false, force: :cascade do |t|
    t.integer "id",                limit: 4,                null: false
    t.string  "tracker_parcel_id", limit: 128, default: "", null: false
    t.string  "tracker_id",        limit: 128, default: "", null: false
    t.string  "parcel_id",         limit: 128, default: "", null: false
    t.string  "driver_id",         limit: 128, default: "", null: false
  end

  add_index "tracker_parcels", ["driver_id"], name: "tracker_parcel_driver", using: :btree
  add_index "tracker_parcels", ["id"], name: "id", unique: true, using: :btree
  add_index "tracker_parcels", ["parcel_id", "tracker_id"], name: "tracker_parcel", unique: true, using: :btree
  add_index "tracker_parcels", ["tracker_id"], name: "tracker_parcel_tracker", using: :btree
  add_index "tracker_parcels", ["tracker_parcel_id"], name: "tracker_parcel_id", unique: true, using: :btree

  create_table "trackers", id: false, force: :cascade do |t|
    t.integer  "id",                 limit: 4,                null: false
    t.string   "tracker_id",         limit: 128, default: "", null: false
    t.datetime "tracker_start_time",                          null: false
    t.datetime "tracker_stop_time",                           null: false
    t.datetime "creation_time"
    t.datetime "modified_time"
  end

  add_index "trackers", ["id"], name: "id", unique: true, using: :btree
  add_index "trackers", ["tracker_id"], name: "tracker_id", unique: true, using: :btree

  add_foreign_key "customer_parcels", "customers", primary_key: "customer_id", name: "customer_parcel_customer", on_update: :cascade, on_delete: :cascade
  add_foreign_key "customer_parcels", "parcels", primary_key: "parcel_id", name: "customer_parcel_parcel", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tracker_locations", "locations", primary_key: "location_id", name: "tracker_location_location", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tracker_locations", "trackers", primary_key: "tracker_id", name: "tracker_location_tracker", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tracker_parcels", "drivers", primary_key: "driver_id", name: "tracker_parcel_driver", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tracker_parcels", "parcels", primary_key: "parcel_id", name: "tracker_parcel_parcel", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tracker_parcels", "trackers", primary_key: "tracker_id", name: "tracker_parcel_tracker", on_update: :cascade, on_delete: :cascade
end
