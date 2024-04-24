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

ActiveRecord::Schema[7.1].define(version: 2024_04_24_010849) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_seekers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.bigint "job_seeker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_seeker_id"], name: "index_locations_on_job_seeker_id"
  end

  create_table "non_availability_dates", force: :cascade do |t|
    t.bigint "job_seeker_id", null: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_non_availability_dates_on_date"
    t.index ["job_seeker_id", "date"], name: "index_non_availability_dates_on_job_seeker_id_and_date"
    t.index ["job_seeker_id"], name: "index_non_availability_dates_on_job_seeker_id"
  end

  create_table "role_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "job_seeker_id", null: false
    t.boolean "status", default: false
    t.integer "rating"
    t.bigint "role_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_seeker_id"], name: "index_roles_on_job_seeker_id"
    t.index ["rating"], name: "index_roles_on_rating"
    t.index ["role_type_id"], name: "index_roles_on_role_type_id"
    t.index ["status"], name: "index_roles_on_status"
  end

  add_foreign_key "locations", "job_seekers"
  add_foreign_key "non_availability_dates", "job_seekers"
  add_foreign_key "roles", "job_seekers"
  add_foreign_key "roles", "role_types"
end
