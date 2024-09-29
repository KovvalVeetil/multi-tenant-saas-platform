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

ActiveRecord::Schema[7.1].define(version: 2024_09_29_175713) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients_legal_cases", id: false, force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "legal_case_id", null: false
    t.index ["client_id"], name: "index_clients_legal_cases_on_client_id"
    t.index ["legal_case_id"], name: "index_clients_legal_cases_on_legal_case_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.string "file_path"
    t.bigint "legal_case_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_case_id"], name: "index_documents_on_legal_case_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "legal_case_id", null: false
    t.decimal "total_amount"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_case_id"], name: "index_invoices_on_legal_case_id"
  end

  create_table "law_firms", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lawyers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.bigint "law_firm_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["law_firm_id"], name: "index_lawyers_on_law_firm_id"
  end

  create_table "lawyers_legal_cases", id: false, force: :cascade do |t|
    t.bigint "lawyer_id", null: false
    t.bigint "legal_case_id", null: false
    t.index ["lawyer_id"], name: "index_lawyers_legal_cases_on_lawyer_id"
    t.index ["legal_case_id"], name: "index_lawyers_legal_cases_on_legal_case_id"
  end

  create_table "legal_cases", force: :cascade do |t|
    t.string "case_number"
    t.string "status"
    t.bigint "law_firm_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["law_firm_id"], name: "index_legal_cases_on_law_firm_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.decimal "amount"
    t.date "payment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_payments_on_invoice_id"
  end

  add_foreign_key "documents", "legal_cases"
  add_foreign_key "invoices", "legal_cases"
  add_foreign_key "lawyers", "law_firms"
  add_foreign_key "legal_cases", "law_firms"
  add_foreign_key "payments", "invoices"
end
