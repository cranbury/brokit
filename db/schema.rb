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

ActiveRecord::Schema.define(version: 20140218202326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: true do |t|
    t.text    "address"
    t.integer "price"
    t.integer "lease_length"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.text    "description"
    t.string  "contact_name"
    t.string  "phone_number"
    t.string  "email"
    t.text    "photo_url"
    t.integer "landlord_id"
    t.string  "neighborhood"
    t.text    "status",       default: "available"
  end

  create_table "client_favorites", force: true do |t|
    t.string  "status"
    t.text    "notes"
    t.integer "apartment_id"
    t.integer "client_id"
  end

  create_table "clients", force: true do |t|
    t.text    "name"
    t.integer "bedrooms_needed"
    t.integer "price_limit"
    t.string  "phone_number"
    t.string  "email"
    t.text    "notes"
    t.integer "user_id"
  end

  create_table "landlords", force: true do |t|
    t.string "name"
    t.string "phone_number"
    t.string "email"
    t.text   "notes"
  end

  create_table "users", force: true do |t|
    t.string  "email"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "account_type"
    t.string  "password_digest"
    t.string  "confirmation_code"
    t.boolean "confirmed",         default: false
  end

end
