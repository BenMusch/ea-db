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

ActiveRecord::Schema.define(version: 20161002172616) do

  create_table "articles", force: :cascade do |t|
    t.integer  "subcategory_id"
    t.string   "url"
    t.integer  "upvotes",        default: 0
    t.integer  "media_type_id"
    t.string   "title"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "difficulty"
    t.text     "description"
    t.integer  "category_id"
  end

  add_index "articles", ["category_id"], name: "index_articles_on_category_id"
  add_index "articles", ["media_type_id"], name: "index_articles_on_media_type_id"
  add_index "articles", ["subcategory_id"], name: "index_articles_on_subcategory_id"

  create_table "authorings", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
