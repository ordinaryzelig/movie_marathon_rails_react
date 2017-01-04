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

ActiveRecord::Schema.define(version: 20170104052058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "theater_showtimes", force: :cascade do |t|
    t.integer "theater_id", null: false
    t.date    "date",       null: false
    t.jsonb   "movies",     null: false
    t.index ["theater_id"], name: "index_theater_showtimes_on_theater_id", using: :btree
  end

  create_table "theaters", force: :cascade do |t|
    t.string "name"
    t.string "remote_id"
  end

  add_foreign_key "theater_showtimes", "theaters"
end