# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_14_025048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "columns", force: :cascade do |t|
    t.bigint "row_id", null: false
    t.bigint "section_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["row_id"], name: "index_columns_on_row_id"
    t.index ["section_id"], name: "index_columns_on_section_id"
  end

  create_table "data_migrations", primary_key: "version", id: :string, force: :cascade do |t|
  end

  create_table "element_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "elements", force: :cascade do |t|
    t.bigint "section_id", null: false
    t.bigint "row_id", null: false
    t.bigint "column_id", null: false
    t.bigint "element_type_id", null: false
    t.string "label"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["column_id"], name: "index_elements_on_column_id"
    t.index ["element_type_id"], name: "index_elements_on_element_type_id"
    t.index ["row_id"], name: "index_elements_on_row_id"
    t.index ["section_id"], name: "index_elements_on_section_id"
  end

  create_table "rows", force: :cascade do |t|
    t.bigint "section_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["section_id"], name: "index_rows_on_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.bigint "application_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["application_id"], name: "index_sections_on_application_id"
  end

  add_foreign_key "columns", "rows"
  add_foreign_key "columns", "sections"
  add_foreign_key "elements", "columns"
  add_foreign_key "elements", "element_types"
  add_foreign_key "elements", "rows"
  add_foreign_key "elements", "sections"
  add_foreign_key "rows", "sections"
  add_foreign_key "sections", "applications"
end
