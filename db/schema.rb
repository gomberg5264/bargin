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

ActiveRecord::Schema.define(version: 2019_03_07_144725) do

  create_table "crono_jobs", force: :cascade do |t|
    t.string "job_id", null: false
    t.text "log", limit: 1073741823
    t.datetime "last_performed_at"
    t.boolean "healthy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_crono_jobs_on_job_id", unique: true
  end

  create_table "hosts", force: :cascade do |t|
    t.string "host"
    t.integer "scraper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scraper_id"], name: "index_hosts_on_scraper_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "last_price"
    t.integer "interval", default: 1440
    t.datetime "last_price_update"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "notification_type"
    t.string "notification_args"
    t.float "threshold"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_notifications_on_item_id"
  end

  create_table "rules", force: :cascade do |t|
    t.string "rule_type"
    t.string "rule_args"
    t.integer "scraper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scraper_id"], name: "index_rules_on_scraper_id"
  end

  create_table "scrapers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
