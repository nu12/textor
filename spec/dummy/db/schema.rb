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

ActiveRecord::Schema.define(version: 2018_02_24_142041) do

  create_table "contents", force: :cascade do |t|
    t.integer "paper_id"
    t.integer "field_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_contents_on_field_id"
    t.index ["paper_id"], name: "index_contents_on_paper_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "name"
    t.string "label"
    t.boolean "is_multivalue"
    t.string "default"
    t.string "open_tag"
    t.string "close_tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "papers", force: :cascade do |t|
    t.string "name"
    t.string "hash_name"
    t.integer "user_id"
    t.integer "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_papers_on_template_id"
    t.index ["user_id"], name: "index_papers_on_user_id"
  end

  create_table "section_fields", force: :cascade do |t|
    t.integer "section_id"
    t.integer "field_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_section_fields_on_field_id"
    t.index ["section_id"], name: "index_section_fields_on_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.boolean "is_editable"
    t.boolean "is_wysiwyg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "template_sections", force: :cascade do |t|
    t.integer "template_id"
    t.integer "section_id"
    t.integer "position"
    t.boolean "is_mandatory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_template_sections_on_section_id"
    t.index ["template_id"], name: "index_template_sections_on_template_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "is_active"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
