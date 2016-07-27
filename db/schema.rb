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

ActiveRecord::Schema.define(version: 20160727121913) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "adt_data", force: :cascade do |t|
    t.string   "x_values"
    t.string   "y1_values"
    t.string   "y2_values"
    t.integer  "adt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "adt_data", ["adt_id"], name: "index_adt_data_on_adt_id"

  create_table "adts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "graph_id"
    t.string   "name"
  end

  add_index "adts", ["graph_id"], name: "index_adts_on_graph_id"

  create_table "categories", force: :cascade do |t|
    t.string   "sheetname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "commentaries", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "typee"
    t.string   "priceTarget"
  end

  create_table "datasets", force: :cascade do |t|
    t.string   "sheet_name"
    t.string   "x_colname"
    t.string   "y1_colname"
    t.string   "y2_colname"
    t.integer  "adt_id"
    t.integer  "graph_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "datasets", ["adt_id"], name: "index_datasets_on_adt_id"
  add_index "datasets", ["graph_id"], name: "index_datasets_on_graph_id"

  create_table "general_market_studies", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "graph_data", force: :cascade do |t|
    t.string   "x_values"
    t.integer  "y1_values"
    t.integer  "y2_values"
    t.integer  "graph_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "timestamp_ms", limit: 8
  end

  add_index "graph_data", ["graph_id"], name: "index_graph_data_on_graph_id"

  create_table "graphs", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.string   "name"
  end

  add_index "graphs", ["category_id"], name: "index_graphs_on_category_id"

  create_table "interesteds", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "market_internals", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "market_studies", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "typee"
    t.string   "price_target"
    t.integer  "user_id"
  end

  create_table "timing_models", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.text     "notification"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "purchased_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.string   "transaction_subject"
    t.datetime "payment_date"
    t.string   "txn_type"
    t.string   "subscr_id"
    t.string   "last_name"
    t.string   "residence_country"
    t.string   "item_name"
    t.string   "payment_gross"
    t.string   "mc_currency"
    t.string   "business"
    t.string   "payment_type"
    t.string   "protection_eligibility"
    t.string   "verify_sign"
    t.string   "payer_status"
    t.string   "test_ipn"
    t.string   "payer_email"
    t.string   "txn_id"
    t.string   "receiver_email"
    t.string   "first_name"
    t.string   "invoice"
    t.string   "payer_id"
    t.string   "receiver_id"
    t.string   "payment_status"
    t.string   "payment_fee"
    t.string   "mc_fee"
    t.string   "mc_gross"
    t.string   "charset"
    t.string   "notify_version"
    t.string   "ipn_track_id"
    t.string   "auth"
    t.string   "mc_amount3"
    t.string   "period3"
    t.string   "subscr_date"
    t.string   "recur_times"
    t.string   "reattempt"
    t.integer  "recurring"
    t.string   "amount3"
  end

  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "account_active",         default: false
    t.boolean  "is_admin",               default: false
    t.boolean  "recurring",              default: true
    t.string   "period",                 default: "Month"
    t.integer  "cycles",                 default: 12
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
