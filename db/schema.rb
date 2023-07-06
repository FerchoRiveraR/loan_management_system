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

ActiveRecord::Schema[7.0].define(version: 2023_07_06_211905) do
  create_table "borrowers", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents_loan_types", id: false, force: :cascade do |t|
    t.integer "document_id", null: false
    t.integer "loan_type_id", null: false
  end

  create_table "lenders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loan_documents", force: :cascade do |t|
    t.integer "loan_id", null: false
    t.integer "document_id", null: false
    t.boolean "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_loan_documents_on_document_id"
    t.index ["loan_id"], name: "index_loan_documents_on_loan_id"
  end

  create_table "loan_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loans", force: :cascade do |t|
    t.integer "lender_id", null: false
    t.integer "borrower_id", null: false
    t.integer "loan_type_id", null: false
    t.integer "status"
    t.date "approved_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["borrower_id"], name: "index_loans_on_borrower_id"
    t.index ["lender_id"], name: "index_loans_on_lender_id"
    t.index ["loan_type_id"], name: "index_loans_on_loan_type_id"
  end

  add_foreign_key "loan_documents", "documents"
  add_foreign_key "loan_documents", "loans"
  add_foreign_key "loans", "borrowers"
  add_foreign_key "loans", "lenders"
  add_foreign_key "loans", "loan_types"
end
