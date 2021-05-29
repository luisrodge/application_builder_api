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

ActiveRecord::Schema.define(version: 2021_05_29_000801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "applications", force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "checkbox_options", force: :cascade do |t|
    t.string "name"
    t.bigint "input_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["input_id"], name: "index_checkbox_options_on_input_id"
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

  create_table "filled_inputs", force: :cascade do |t|
    t.string "input_type"
    t.string "value"
    t.string "label"
    t.bigint "input_id", null: false
    t.bigint "submission_column_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "submission_id", null: false
    t.index ["input_id"], name: "index_filled_inputs_on_input_id"
    t.index ["submission_column_id"], name: "index_filled_inputs_on_submission_column_id"
    t.index ["submission_id"], name: "index_filled_inputs_on_submission_id"
  end

  create_table "inputs", force: :cascade do |t|
    t.string "label"
    t.boolean "required", default: false
    t.bigint "column_id", null: false
    t.string "input_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["column_id"], name: "index_inputs_on_column_id"
    t.index ["name"], name: "index_inputs_on_name", unique: true
  end

  create_table "radio_options", force: :cascade do |t|
    t.string "name"
    t.bigint "input_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["input_id"], name: "index_radio_options_on_input_id"
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

  create_table "submission_columns", force: :cascade do |t|
    t.bigint "submission_row_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["submission_row_id"], name: "index_submission_columns_on_submission_row_id"
  end

  create_table "submission_rows", force: :cascade do |t|
    t.bigint "submission_section_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["submission_section_id"], name: "index_submission_rows_on_submission_section_id"
  end

  create_table "submission_sections", force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.bigint "submission_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["submission_id"], name: "index_submission_sections_on_submission_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.bigint "application_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.index ["application_id"], name: "index_submissions_on_application_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "checkbox_options", "inputs"
  add_foreign_key "columns", "rows"
  add_foreign_key "columns", "sections"
  add_foreign_key "filled_inputs", "inputs"
  add_foreign_key "filled_inputs", "submission_columns"
  add_foreign_key "filled_inputs", "submissions"
  add_foreign_key "inputs", "columns"
  add_foreign_key "radio_options", "inputs"
  add_foreign_key "rows", "sections"
  add_foreign_key "sections", "applications"
  add_foreign_key "submission_columns", "submission_rows"
  add_foreign_key "submission_rows", "submission_sections"
  add_foreign_key "submission_sections", "submissions"
  add_foreign_key "submissions", "applications"
end
