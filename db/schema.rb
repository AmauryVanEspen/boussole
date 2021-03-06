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

ActiveRecord::Schema.define(version: 20161006135355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercise_scopes", force: :cascade do |t|
    t.integer  "social_right_id",  null: false
    t.integer  "exercisable_id",   null: false
    t.string   "exercisable_type", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "exercise_scopes", ["exercisable_type", "exercisable_id"], name: "index_exercise_scopes_on_exercisable_type_and_exercisable_id", using: :btree
  add_index "exercise_scopes", ["social_right_id"], name: "index_exercise_scopes_on_social_right_id", using: :btree

  create_table "features", force: :cascade do |t|
    t.string   "key",                        null: false
    t.boolean  "enabled",    default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "housings", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "duration"
    t.string   "current_status"
    t.integer  "resources",      default: 0
    t.integer  "age"
    t.string   "housing_city"
    t.string   "residence_city"
    t.boolean  "next_status",    default: false
  end

  create_table "measures", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.integer  "public_service_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "measures", ["public_service_id"], name: "index_measures_on_public_service_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "knowledge"
    t.integer  "age"
    t.string   "status"
    t.string   "last_class"
    t.string   "city"
    t.boolean  "handicap"
    t.boolean  "experience"
    t.boolean  "pe"
    t.boolean  "ml"
    t.boolean  "cap"
    t.boolean  "apec"
    t.string   "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "domain"
    t.string   "formation"
    t.string   "degree"
    t.boolean  "intention"
  end

  create_table "public_services", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "postal_address"
    t.string   "email"
    t.string   "phone"
    t.string   "url"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "slug"
    t.integer  "response_time_upper_bound"
  end

  add_index "public_services", ["response_time_upper_bound"], name: "index_public_services_on_response_time_upper_bound", using: :btree
  add_index "public_services", ["slug"], name: "index_public_services_on_slug", unique: true, using: :btree

  create_table "service_offerings", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "public_service_id",         null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "postal_address"
    t.string   "email"
    t.string   "phone"
    t.string   "url"
    t.string   "slug"
    t.integer  "response_time_upper_bound"
  end

  add_index "service_offerings", ["public_service_id", "slug"], name: "index_service_offerings_on_public_service_id_and_slug", unique: true, using: :btree
  add_index "service_offerings", ["public_service_id"], name: "index_service_offerings_on_public_service_id", using: :btree
  add_index "service_offerings", ["response_time_upper_bound"], name: "index_service_offerings_on_response_time_upper_bound", using: :btree

  create_table "social_rights", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "social_rights", ["slug"], name: "index_social_rights_on_slug", unique: true, using: :btree

  create_table "workings", force: :cascade do |t|
    t.string   "awareness"
    t.string   "sector"
    t.boolean  "experience",     default: false
    t.string   "duration"
    t.string   "engagement"
    t.string   "status"
    t.integer  "age"
    t.boolean  "handicap",       default: false
    t.string   "last_class"
    t.string   "city"
    t.boolean  "pole_emploi",    default: false
    t.boolean  "mission_locale", default: false
    t.boolean  "cap_emploi",     default: false
    t.boolean  "apec",           default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_foreign_key "exercise_scopes", "social_rights"
  add_foreign_key "measures", "public_services"
  add_foreign_key "service_offerings", "public_services"
end
