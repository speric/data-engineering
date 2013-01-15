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

ActiveRecord::Schema.define(:version => 20130115121451) do

  create_table "customers", :force => true do |t|
    t.string   "full_name",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "customers", ["full_name"], :name => "index_customers_on_full_name"

  create_table "merchants", :force => true do |t|
    t.string   "full_name",  :null => false
    t.string   "address",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "merchants", ["address"], :name => "index_merchants_on_address"
  add_index "merchants", ["full_name"], :name => "index_merchants_on_full_name"

  create_table "orders", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "voucher_id"
    t.integer  "merchant_id"
    t.integer  "voucher_count"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"
  add_index "orders", ["merchant_id"], :name => "index_orders_on_merchant_id"
  add_index "orders", ["voucher_id"], :name => "index_orders_on_voucher_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "full_name",           :null => false
    t.string   "email",               :null => false
    t.string   "crypted_password",    :null => false
    t.string   "password_salt",       :null => false
    t.string   "persistence_token",   :null => false
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.string   "single_access_token"
  end

  create_table "vouchers", :force => true do |t|
    t.string   "description", :null => false
    t.string   "price"
    t.string   "decimal"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "vouchers", ["description"], :name => "index_vouchers_on_description"

end
