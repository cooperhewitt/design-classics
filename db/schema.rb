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

ActiveRecord::Schema.define(:version => 20121127221702) do

  create_table "thingings", :force => true do |t|
    t.integer  "thing_id",         :null => false
    t.integer  "type_of_thing_id", :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "thingings", ["thing_id", "type_of_thing_id"], :name => "index_thingings_on_thing_id_and_type_of_thing_id", :unique => true

  create_table "things", :force => true do |t|
    t.string   "name",                             :null => false
    t.integer  "ch_id"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "types_count"
    t.integer  "classicness_score", :default => 0, :null => false
  end

  add_index "things", ["ch_id"], :name => "index_things_on_ch_id", :unique => true

  create_table "types_of_thing", :force => true do |t|
    t.string   "name",                                    :null => false
    t.integer  "things_count",             :default => 0, :null => false
    t.integer  "ch_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "things_with_images_count", :default => 0, :null => false
  end

  add_index "types_of_thing", ["ch_id"], :name => "index_types_of_thing_on_ch_id", :unique => true
  add_index "types_of_thing", ["name"], :name => "index_types_of_thing_on_name", :unique => true

end
