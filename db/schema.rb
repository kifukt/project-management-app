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

ActiveRecord::Schema.define(version: 20180408211904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", primary_key: "card_id", force: :cascade do |t|
    t.integer "list_id"
    t.string "title"
    t.string "description"
    t.bigint "creator_id"
    t.integer "updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_cards_on_creator_id"
  end

  create_table "comments", primary_key: "comment_id", force: :cascade do |t|
    t.integer "card_id"
    t.string "content"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.index ["creator_id"], name: "index_comments_on_creator_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "groups", primary_key: "group_id", force: :cascade do |t|
    t.bigint "leader_id"
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_groups_on_creator_id"
    t.index ["leader_id"], name: "index_groups_on_leader_id"
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "lists", primary_key: "list_id", force: :cascade do |t|
    t.integer "table_id"
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.index ["creator_id"], name: "index_lists_on_creator_id"
  end

  create_table "tables", primary_key: "table_id", force: :cascade do |t|
    t.string "name"
    t.string "creator_type"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.string "slug"
    t.index ["creator_type", "creator_id"], name: "index_tables_on_creator_type_and_creator_id"
  end

  create_table "tasks", primary_key: "taks_id", force: :cascade do |t|
    t.integer "tasks_list_id"
    t.string "content"
    t.boolean "is_finished", default: false
    t.integer "assigned_to"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.index ["creator_id"], name: "index_tasks_on_creator_id"
  end

  create_table "tasks_lists", primary_key: "tasks_list_id", force: :cascade do |t|
    t.integer "card_id"
    t.string "name"
    t.bigint "creator_id"
    t.datetime "created_at", null: false
    t.index ["creator_id"], name: "index_tasks_lists_on_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "login"
    t.string "first_name"
    t.string "last_name"
    t.string "avatar_file_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cards", "users", column: "creator_id"
  add_foreign_key "comments", "users", column: "creator_id"
  add_foreign_key "groups", "users", column: "creator_id"
  add_foreign_key "groups", "users", column: "leader_id"
  add_foreign_key "lists", "users", column: "creator_id"
  add_foreign_key "tasks", "users", column: "creator_id"
  add_foreign_key "tasks_lists", "users", column: "creator_id"
end
