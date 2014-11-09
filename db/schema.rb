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

ActiveRecord::Schema.define(:version => 20141109155719) do

  create_table "comments", :force => true do |t|
    t.integer  "commenter_id"
    t.text     "body"
    t.integer  "tasklist_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "comments", ["tasklist_id"], :name => "index_comments_on_tasklist_id"

  create_table "tasklists", :force => true do |t|
    t.string   "subject"
    t.string   "status"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "role"
    t.string   "uid"
    t.string   "provider"
    t.string   "salt_pass"
    t.string   "hash_pass"
    t.boolean  "active"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "email"
  end

  add_index "users", ["name"], :name => "index_users_on_name"

end
