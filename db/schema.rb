# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090602020207) do

  create_table "bioers", :force => true do |t|
    t.string   "menu_id",    :null => false
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "categoryid",                         :default => "",    :null => false
    t.string   "categoryname"
    t.integer  "categoryorder"
    t.text     "content"
    t.string   "contentpic"
    t.string   "url"
    t.string   "summary",           :limit => 10000
    t.string   "summarypic"
    t.datetime "createdate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "istop",                              :default => false
    t.text     "particularcontent"
  end

  create_table "categorylists", :force => true do |t|
    t.string   "categoryid",                    :default => "", :null => false
    t.string   "title"
    t.integer  "titleorder"
    t.string   "titlestyle"
    t.string   "titleurl"
    t.text     "content"
    t.string   "contentpic"
    t.string   "writer"
    t.string   "keyword"
    t.string   "attribute"
    t.string   "summary",      :limit => 10000
    t.string   "summarypic"
    t.datetime "createdate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "downloadfile"
  end

  create_table "contacts", :force => true do |t|
    t.string   "categoryid", :default => "",    :null => false
    t.string   "country"
    t.string   "area"
    t.string   "company"
    t.string   "person"
    t.string   "addr"
    t.string   "phone"
    t.string   "email"
    t.string   "fax"
    t.string   "zipcode"
    t.text     "content"
    t.datetime "createdate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "istop",      :default => false
    t.string   "handset"
    t.string   "province"
  end

  create_table "en_categories", :force => true do |t|
    t.string   "categoryid",                         :default => "", :null => false
    t.string   "categoryname"
    t.integer  "categoryorder"
    t.text     "content"
    t.text     "particularcontent"
    t.string   "contentpic"
    t.string   "url"
    t.string   "summary",           :limit => 10000
    t.string   "summarypic"
    t.datetime "createdate"
    t.boolean  "istop"
  end

  create_table "en_categorylists", :force => true do |t|
    t.string   "categoryid",                         :default => "", :null => false
    t.string   "title"
    t.integer  "titleorder"
    t.string   "titlestyle"
    t.string   "titleurl"
    t.text     "content"
    t.text     "particularcontent"
    t.string   "contentpic"
    t.string   "writer"
    t.string   "keyword"
    t.string   "attribute"
    t.string   "summary",           :limit => 10000
    t.string   "summarypic"
    t.datetime "createdate"
    t.string   "downloadfile"
  end

  create_table "en_contacts", :force => true do |t|
    t.string   "categoryid", :null => false
    t.string   "country"
    t.string   "area"
    t.string   "company"
    t.string   "person"
    t.string   "addr"
    t.string   "phone"
    t.string   "email"
    t.string   "fax"
    t.string   "zipcode"
    t.text     "content"
    t.datetime "createdate"
  end

  create_table "en_orders", :force => true do |t|
    t.string   "depart"
    t.string   "poth"
    t.integer  "num"
    t.text     "info"
    t.string   "workadd"
    t.datetime "overdate"
    t.datetime "createdate"
  end

  create_table "machinecodes", :force => true do |t|
    t.string   "machinecode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", :force => true do |t|
    t.string  "menuname"
    t.string  "menuurl"
    t.integer "menudeep1"
    t.integer "menudeep2"
  end

  create_table "orders", :force => true do |t|
    t.string   "depart"
    t.string   "poth"
    t.integer  "num"
    t.text     "info"
    t.datetime "createdate"
    t.string   "workadd"
    t.datetime "overdate"
  end

  create_table "users", :force => true do |t|
    t.string "name"
    t.string "hashed_password"
    t.string "salt"
  end

end
