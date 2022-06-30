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

ActiveRecord::Schema.define(version: 2022_06_30_210338) do

  create_table "messages", force: :cascade do |t|
    t.string "body"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nurses", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.integer "age"
    t.string "sex"
    t.integer "doctor_id"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patient_details", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "temperature"
    t.string "pressure"
    t.string "SPO2"
    t.string "Doctor_Remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "doctor_id"
    t.integer "heartrate"
  end

  create_table "patients", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.integer "age"
    t.string "sex"
    t.integer "doctor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
