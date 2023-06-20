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

ActiveRecord::Schema[7.0].define(version: 2023_06_17_160115) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.text "description"
    t.date "start"
    t.date "end"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "guest_id", null: false
    t.index ["event_id"], name: "index_activities_on_event_id"
    t.index ["guest_id"], name: "index_activities_on_guest_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "address"
    t.date "start"
    t.date "end"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.boolean "status"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "guest_activities", force: :cascade do |t|
    t.bigint "guest_id", null: false
    t.bigint "activity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_guest_activities_on_activity_id"
    t.index ["guest_id"], name: "index_guest_activities_on_guest_id"
  end

  create_table "guests", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_guests_on_event_id"
    t.index ["user_id"], name: "index_guests_on_user_id"
  end

  create_table "propositions", force: :cascade do |t|
    t.text "description"
    t.bigint "activity_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "guest_id", null: false
    t.index ["activity_id"], name: "index_propositions_on_activity_id"
    t.index ["guest_id"], name: "index_propositions_on_guest_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "events"
  add_foreign_key "activities", "guests"
  add_foreign_key "events", "users"
  add_foreign_key "guest_activities", "activities"
  add_foreign_key "guest_activities", "guests"
  add_foreign_key "guests", "events"
  add_foreign_key "guests", "users"
  add_foreign_key "propositions", "activities"
  add_foreign_key "propositions", "guests"
end
