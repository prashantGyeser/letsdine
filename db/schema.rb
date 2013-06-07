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

ActiveRecord::Schema.define(:version => 20130607165622) do

  create_table "attendees", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "seats"
    t.string   "phone_number"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "discussions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_notify_emails", :force => true do |t|
    t.string   "email_address"
    t.integer  "event_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "event_name"
    t.text     "event_description"
    t.date     "event_date"
    t.time     "event_time"
    t.integer  "restaurant_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "event_image"
    t.text     "invitees"
    t.integer  "user_id"
    t.integer  "max_seats"
    t.string   "status"
    t.string   "token"
    t.string   "event_type"
    t.string   "city"
    t.string   "reminder"
    t.string   "special"
  end

  create_table "experiences", :force => true do |t|
    t.string   "name"
    t.text     "about"
    t.string   "address"
    t.string   "city"
    t.integer  "cost"
    t.integer  "min_pax"
    t.string   "experience_picture"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "group_image"
    t.string   "category"
  end

  create_table "members", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "menu_items", :force => true do |t|
    t.text     "name"
    t.string   "course_name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "restaurant_id"
    t.integer  "experience_id"
  end

  create_table "new_city_notifications", :force => true do |t|
    t.string   "city"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "picture"
    t.text     "about"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "cusine"
    t.string   "photo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "price"
    t.string   "city"
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.text     "details"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_invites", :force => true do |t|
    t.integer  "user_id"
    t.text     "email_invites"
    t.string   "facebook_share"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "event_id"
  end

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
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "oauth_expires_at"
    t.string   "image"
    t.string   "city"
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
