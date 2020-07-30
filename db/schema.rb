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

ActiveRecord::Schema.define(version: 20200721120041) do

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "brand_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  end

  create_table "deliver_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "deliver_family_name"
    t.string   "deliver_first_name"
    t.string   "deliver_family_name_kana"
    t.string   "deliver_first_name_kana"
    t.string   "deliver_yubin_bango"
    t.string   "deliver_todofuken"
    t.string   "deliver_shichoson"
    t.string   "deliver_banchi"
    t.string   "deliver_building"
    t.string   "deliver_tel_no"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "favorites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_favorites_on_item_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id"
    t.string   "item_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "item_name"
    t.string   "item_info"
    t.integer  "category_id"
    t.integer  "brand_id"
    t.string   "condition"
    t.string   "postage_burden"
    t.string   "shipping_area"
    t.string   "days_to_ship"
    t.integer  "price"
    t.integer  "trading_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "sns_credentials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sns_credentials_on_user_id", using: :btree
  end

  create_table "tradings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "trading_family_name"
    t.string   "trading_first_name"
    t.string   "trading_family_name_kana"
    t.string   "trading_first_name_kana"
    t.string   "trading_yubin_bango"
    t.string   "trading_todofuken"
    t.string   "trading_shichoson"
    t.string   "trading_banchi"
    t.string   "trading_building"
    t.string   "trading_tel_no"
    t.string   "trading_card_id"
    t.string   "trading_customer_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "user_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "user_yubin_bango"
    t.string   "user_todofuken"
    t.string   "user_shichoson"
    t.string   "user_banchi"
    t.string   "user_building"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "user_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",     null: false
    t.string   "customer_id", null: false
    t.string   "card_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                            null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "family_name",                         null: false
    t.string   "first_name",                          null: false
    t.string   "family_name_kana",                    null: false
    t.string   "first_name_kana",                     null: false
    t.date     "birthday",                            null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "favorites", "items"
  add_foreign_key "favorites", "users"
  add_foreign_key "sns_credentials", "users"
end
