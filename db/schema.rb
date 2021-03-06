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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180513120105) do

  create_table "accounts", force: :cascade do |t|
    t.date     "transaction_date"
    t.text     "particular",       limit: 65535
    t.float    "debit",            limit: 24
    t.float    "credit",           limit: 24
    t.integer  "customer_id",      limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "accounts", ["customer_id"], name: "index_accounts_on_customer_id", using: :btree

  create_table "balance_enquiries", force: :cascade do |t|
    t.integer  "lena",         limit: 4
    t.integer  "dena",         limit: 4
    t.date     "balance_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "karigar_id",   limit: 4
  end

  add_index "balance_enquiries", ["karigar_id"], name: "index_balance_enquiries_on_karigar_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "address",    limit: 65535
    t.string   "phone",      limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.integer  "product_id",          limit: 4
  end

  create_table "items", force: :cascade do |t|
    t.string   "item_name",  limit: 50
    t.integer  "product_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "items", ["product_id"], name: "index_items_on_product_id", using: :btree

  create_table "karigars", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "phone",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "unit",        limit: 255
    t.float    "price",       limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "piece_count", limit: 4
  end

  create_table "materials_products", id: false, force: :cascade do |t|
    t.integer "product_id",  limit: 4, null: false
    t.integer "material_id", limit: 4, null: false
  end

  add_index "materials_products", ["material_id", "product_id"], name: "index_materials_products_on_material_id_and_product_id", using: :btree

  create_table "notepads", force: :cascade do |t|
    t.date     "note_date"
    t.string   "name",       limit: 255
    t.float    "amount",     limit: 24
    t.integer  "status",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.datetime "deleted_at"
  end

  add_index "notepads", ["deleted_at"], name: "index_notepads_on_deleted_at", using: :btree

  create_table "prices", force: :cascade do |t|
    t.integer  "product_id",       limit: 4
    t.integer  "material_id",      limit: 4
    t.integer  "quantity",         limit: 4
    t.float    "calculated_price", limit: 24
    t.string   "unit",             limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "prices", ["material_id"], name: "index_prices_on_material_id", using: :btree
  add_index "prices", ["product_id"], name: "index_prices_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "product_number", limit: 4
    t.string   "name",           limit: 45
    t.text     "description",    limit: 65535
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.float    "majdoori",       limit: 24
    t.decimal  "total_price",                  precision: 10, scale: 3
    t.integer  "piece",          limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "accounts", "customers"
  add_foreign_key "balance_enquiries", "karigars"
  add_foreign_key "items", "products"
  add_foreign_key "prices", "materials"
  add_foreign_key "prices", "products"
end
