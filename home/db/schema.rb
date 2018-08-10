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

ActiveRecord::Schema.define(version: 2018_08_06_102432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.string "file_container_type"
    t.bigint "file_container_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "file_date"
    t.index ["file_container_type", "file_container_id"], name: "index_attachments_on_file_container_type_and_file_container_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "date"
    t.integer "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "complitely_date"
    t.integer "comments_count"
  end

  create_table "cards_labels", id: false, force: :cascade do |t|
    t.bigint "card_id", null: false
    t.bigint "label_id", null: false
    t.index ["card_id", "label_id"], name: "index_cards_labels_on_card_id_and_label_id"
  end

  create_table "cards_users", id: false, force: :cascade do |t|
    t.bigint "card_id", null: false
    t.bigint "user_id", null: false
    t.index ["card_id", "user_id"], name: "index_cards_users_on_card_id_and_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dashboards", force: :cascade do |t|
    t.string "title"
    t.boolean "visions"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string "color"
    t.string "name"
    t.integer "dashboard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string "title"
    t.integer "dashboard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dashboard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.text "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
