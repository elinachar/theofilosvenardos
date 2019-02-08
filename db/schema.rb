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

ActiveRecord::Schema.define(version: 2019_02_08_105252) do

  create_table "baptism_album_translations", force: :cascade do |t|
    t.integer "baptism_album_id"
    t.integer "language_id"
    t.string "title"
    t.text "description"
    t.index ["baptism_album_id"], name: "index_baptism_album_translations_on_baptism_album_id"
    t.index ["language_id"], name: "index_baptism_album_translations_on_language_id"
  end

  create_table "baptism_albums", force: :cascade do |t|
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_square"
    t.date "baptism_on"
  end

  create_table "baptism_photos", force: :cascade do |t|
    t.string "photo"
    t.integer "baptism_album_id"
    t.index ["baptism_album_id"], name: "index_baptism_photos_on_baptism_album_id"
  end

  create_table "faqs", force: :cascade do |t|
    t.text "question"
    t.text "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interior_album_translations", force: :cascade do |t|
    t.integer "language_id"
    t.string "title"
    t.text "description"
    t.integer "interior_album_id"
    t.index ["interior_album_id"], name: "index_interior_album_translations_on_interior_album_id"
    t.index ["language_id"], name: "index_interior_album_translations_on_language_id"
  end

  create_table "interior_albums", force: :cascade do |t|
    t.string "photo"
    t.date "interior_on"
    t.string "photo_square"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interior_photos", force: :cascade do |t|
    t.string "photo"
    t.integer "interior_album_id"
    t.index ["interior_album_id"], name: "index_interior_photos_on_interior_album_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
  end

  create_table "testimonials", force: :cascade do |t|
    t.string "signature"
    t.date "testimonial_on"
    t.text "description"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "language_id"
    t.index ["language_id"], name: "index_testimonials_on_language_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wedding_album_translations", force: :cascade do |t|
    t.integer "wedding_album_id"
    t.integer "language_id"
    t.string "title"
    t.text "description"
    t.index ["language_id"], name: "index_wedding_album_translations_on_language_id"
    t.index ["wedding_album_id"], name: "index_wedding_album_translations_on_wedding_album_id"
  end

  create_table "wedding_albums", force: :cascade do |t|
    t.string "photo"
    t.date "wedding_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_square"
  end

  create_table "wedding_photos", force: :cascade do |t|
    t.integer "wedding_album_id"
    t.string "photo"
    t.index ["wedding_album_id"], name: "index_wedding_photos_on_wedding_album_id"
  end

end
