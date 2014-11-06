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

ActiveRecord::Schema.define(:version => 20141104174352) do

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
    t.string   "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login"
    t.string   "role"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "hash_pass"
    t.string   "salt_pass"
    t.text     "provider"
    t.integer  "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.boolean  "active"
    t.string   "lat"
    t.string   "long"
  end

end
