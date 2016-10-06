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

ActiveRecord::Schema.define(version: 20161004054801) do

  create_table "checkingins", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "checked_in"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_no"
    t.string   "card_type"
    t.string   "ccv"
    t.string   "card_expiry"
    t.string   "street"
    t.string   "suburb"
    t.string   "postcode"
    t.string   "city"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "delivers", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "package_delivered"
    t.string   "signature"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_email"
    t.string   "assigned_truck_rego"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "password_digest"
  end

  create_table "operators", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "no_packages"
    t.string   "gross_weight"
    t.string   "pickup_time"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "receiver_name"
    t.string   "receiver_street"
    t.string   "receiver_suburb"
    t.string   "receiver_city"
    t.string   "receiver_postcode"
    t.string   "insurance"
  end

  create_table "pickups", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "collected"
    t.string   "signature"
    t.string   "charge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
