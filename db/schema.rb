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

ActiveRecord::Schema.define(version: 20140424015857) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ambience_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goods_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "music_styles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personalities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preferences", force: true do |t|
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id", using: :btree

  create_table "questions", force: true do |t|
    t.integer  "survey_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: true do |t|
    t.integer  "answer_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["answer_id"], name: "index_responses_on_answer_id", using: :btree
  add_index "responses", ["user_id"], name: "index_responses_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "scents", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", force: true do |t|
    t.integer  "category_id"
    t.integer  "features_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "space_type_id"
    t.integer  "location_type_id"
    t.integer  "goods_type_id"
    t.integer  "ambience_type_id"
    t.integer  "character_type_id"
  end

  add_index "searches", ["category_id"], name: "index_searches_on_category_id", using: :btree
  add_index "searches", ["features_id"], name: "index_searches_on_features_id", using: :btree

  create_table "space_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "store_categories", force: true do |t|
    t.integer  "store_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "store_categories", ["category_id"], name: "index_store_categories_on_category_id", using: :btree
  add_index "store_categories", ["store_id"], name: "index_store_categories_on_store_id", using: :btree

  create_table "store_features", force: true do |t|
    t.integer  "store_id"
    t.integer  "type_id"
    t.decimal  "degree"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "store_features", ["store_id"], name: "index_store_features_on_store_id", using: :btree
  add_index "store_features", ["type_id"], name: "index_store_features_on_type_id", using: :btree

  create_table "store_locations", force: true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "store_locations", ["store_id"], name: "index_store_locations_on_store_id", using: :btree

  create_table "store_music_styles", force: true do |t|
    t.integer  "store_id"
    t.integer  "music_style_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "degree"
  end

  add_index "store_music_styles", ["music_style_id"], name: "index_store_music_styles_on_music_style_id", using: :btree
  add_index "store_music_styles", ["store_id"], name: "index_store_music_styles_on_store_id", using: :btree

  create_table "store_personalities", force: true do |t|
    t.integer  "store_id"
    t.integer  "personality_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "degree"
  end

  add_index "store_personalities", ["personality_id"], name: "index_store_personalities_on_personality_id", using: :btree
  add_index "store_personalities", ["store_id"], name: "index_store_personalities_on_store_id", using: :btree

  create_table "store_scents", force: true do |t|
    t.integer  "store_id"
    t.integer  "scent_id"
    t.decimal  "degree"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "store_scents", ["scent_id"], name: "index_store_scents_on_scent_id", using: :btree
  add_index "store_scents", ["store_id"], name: "index_store_scents_on_store_id", using: :btree

  create_table "store_styles", force: true do |t|
    t.integer  "store_id"
    t.integer  "style_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "degree"
  end

  add_index "store_styles", ["store_id"], name: "index_store_styles_on_store_id", using: :btree
  add_index "store_styles", ["style_id"], name: "index_store_styles_on_style_id", using: :btree

  create_table "stores", force: true do |t|
    t.string   "name"
    t.integer  "prices"
    t.integer  "busyness"
    t.integer  "noise"
    t.decimal  "adventure"
    t.decimal  "convenience"
    t.decimal  "bargain"
    t.string   "website"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_url"
    t.integer  "variety"
    t.integer  "discounts"
    t.integer  "size"
    t.integer  "organization"
    t.integer  "parking"
    t.string   "public_transit"
    t.string   "stores_nearby"
    t.string   "accessible"
    t.integer  "sales"
    t.string   "image"
    t.string   "thumbnail1"
    t.string   "thumbnail2"
    t.string   "thumbnail3"
  end

  create_table "styles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
