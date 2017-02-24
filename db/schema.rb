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

ActiveRecord::Schema.define(version: 20170219142706) do

  create_table "participations", force: :cascade do |t|
    t.integer  "user_id",                      null: false
    t.integer  "plan_item_id",                 null: false
    t.boolean  "canceled",     default: false, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["plan_item_id"], name: "index_participations_on_plan_item_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "plan_items", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.string   "name",        null: false
    t.text     "description", null: false
    t.datetime "starts_at",   null: false
    t.datetime "ends_at",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_plan_items_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name",       null: false
    t.string   "name",            null: false
    t.string   "hashed_password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
