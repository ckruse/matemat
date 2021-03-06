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

ActiveRecord::Schema.define(:version => 8) do

  create_table "accounts", :primary_key => "account_id", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bookings", :primary_key => "booking_id", :force => true do |t|
    t.integer  "account_id",                               :null => false
    t.integer  "product_id"
    t.decimal  "value",      :precision => 8, :scale => 2, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "order_positions", :primary_key => "position_id", :force => true do |t|
    t.string   "name"
    t.decimal  "price",      :precision => 8, :scale => 2, :default => 0.0,   :null => false
    t.boolean  "paid",                                     :default => false, :null => false
    t.integer  "order_id"
    t.integer  "user_id"
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
  end

  create_table "orders", :primary_key => "order_id", :force => true do |t|
    t.integer  "pizzeria_id",                   :null => false
    t.boolean  "open",        :default => true, :null => false
    t.integer  "user_id",                       :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "pizzas", :primary_key => "pizza_id", :force => true do |t|
    t.integer "pizzeria_id",                                                :null => false
    t.string  "name",                                                       :null => false
    t.decimal "price",       :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.string  "ingredients"
  end

  create_table "pizzerias", :primary_key => "pizzeria_id", :force => true do |t|
    t.string   "name",           :null => false
    t.string   "business_hours", :null => false
    t.string   "email"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "products", :primary_key => "product_id", :force => true do |t|
    t.string   "name",                                                      :null => false
    t.decimal  "price_int",  :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "price_ext",  :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "deposit",    :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
  end

  create_table "users", :primary_key => "user_id", :force => true do |t|
    t.string   "username",                               :null => false
    t.string   "display_name",                           :null => false
    t.string   "email",                                  :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "admin",               :default => false
    t.boolean  "is_member",           :default => true
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["last_logout_at", "last_activity_at"], :name => "index_users_on_last_logout_at_and_last_activity_at"

end
