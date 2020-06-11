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

ActiveRecord::Schema.define(version: 2020_06_11_125812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "designation"
    t.string "department"
    t.string "emp_id"
    t.string "account_no"
    t.string "pan_no"
    t.string "pf_no"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  create_table "payrols", force: :cascade do |t|
    t.string "month"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_payrols_on_company_id"
  end

  create_table "salary_details", force: :cascade do |t|
    t.bigint "working_days"
    t.float "pf"
    t.float "basic"
    t.float "hra"
    t.float "incentives"
    t.float "lic"
    t.float "total_earning"
    t.float "pf_deduction"
    t.float "esi_deduction"
    t.float "pt_deduction"
    t.float "tds_deduction"
    t.float "total_deduction"
    t.float "total_paid_amount"
    t.bigint "employee_id"
    t.bigint "payrol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_salary_details_on_employee_id"
    t.index ["payrol_id"], name: "index_salary_details_on_payrol_id"
  end

end
