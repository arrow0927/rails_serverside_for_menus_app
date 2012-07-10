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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120709015425) do

  create_table "addresses", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "business_name"
    t.string   "address"
    t.string   "telephone_1"
    t.string   "url"
    t.string   "fax"
    t.string   "telephone_2"
    t.string   "city"
  end

  create_table "businesses", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "telephone1"
    t.string   "url"
    t.string   "fax"
    t.string   "telephone2"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "listings", :force => true do |t|
    t.string   "name",                  :default => "Not Available"
    t.string   "telephone",             :default => "Not Available"
    t.string   "fax",                   :default => "Not Available"
    t.string   "suite",                 :default => "Not Available"
    t.string   "address",               :default => "Not Available"
    t.string   "city",                  :default => "Not Available"
    t.string   "province",              :default => "Not Available"
    t.string   "postal_code",           :default => "Not Available"
    t.string   "latitude",              :default => "Not Available"
    t.string   "longitude",             :default => "Not Available"
    t.string   "business_type",         :default => "Not Available"
    t.string   "sub_type",              :default => "Not Available"
    t.string   "owner",                 :default => "Not Available"
    t.string   "source",                :default => "Not Available"
    t.string   "local_area",            :default => "Not Available"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.boolean  "checked"
    t.boolean  "menu_collected"
    t.boolean  "menu_digitized"
    t.boolean  "menu_in_database"
    t.boolean  "keep",                  :default => true
    t.boolean  "get_menu_from_website", :default => true
    t.text     "notes"
    t.string   "menu_state"
    t.string   "menu_source"
  end

  create_table "menu_items", :force => true do |t|
    t.string   "listing_name"
    t.string   "category_1"
    t.string   "category_2"
    t.string   "category_3"
    t.string   "menu_item_name"
    t.string   "price"
    t.string   "description"
    t.string   "add_on_1"
    t.string   "price_add_on_1"
    t.string   "add_on_2"
    t.string   "price_add_on_2"
    t.text     "notes"
    t.string   "typist"
    t.string   "source"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "s3_files", :force => true do |t|
    t.string   "owner"
    t.text     "notes"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "last_accessed_by_user"
    t.datetime "last_accessed_time_stamp"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.string   "owner_role"
  end

  create_table "unused_listings", :force => true do |t|
    t.string   "name"
    t.string   "telephone"
    t.string   "fax"
    t.string   "suite"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "business_type"
    t.string   "sub_type"
    t.string   "owner"
    t.string   "source"
    t.string   "local_area"
    t.boolean  "checked"
    t.boolean  "menu_collected"
    t.boolean  "menu_digitized"
    t.boolean  "menu_in_database"
    t.boolean  "keep"
    t.boolean  "get_menu_from_website"
    t.text     "notes"
    t.string   "menu_state"
    t.string   "menu_source"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "unwanted_cities", :force => true do |t|
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "name"
    t.string   "telephone"
    t.string   "fax"
    t.string   "suite"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "business_type"
    t.string   "sub_type"
    t.string   "owner"
    t.string   "source"
    t.string   "local_area"
    t.boolean  "checked"
    t.boolean  "menu_collected"
    t.boolean  "menu_digitized"
    t.boolean  "menu_in_database"
    t.boolean  "keep"
    t.boolean  "get_menu_from_website"
    t.text     "notes"
    t.string   "menu_state"
    t.string   "menu_source"
  end

  create_table "user_resource_relationships", :force => true do |t|
    t.integer  "s3_file_id"
    t.integer  "user_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.text     "summary"
    t.string   "last_accessed_by_user"
    t.datetime "last_accessed_time_stamp"
  end

  add_index "user_resource_relationships", ["s3_file_id", "user_id"], :name => "index_user_resource_relationships_on_s3_file_id_and_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
