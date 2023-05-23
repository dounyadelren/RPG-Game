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

ActiveRecord::Schema[7.0].define(version: 2022_12_16_152106) do
  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "level", default: 1
    t.integer "xp", default: 0
    t.integer "PV", default: 10
    t.integer "STR", default: 10
    t.integer "helmet"
    t.integer "weapon"
    t.integer "shield"
    t.integer "inventory"
    t.integer "pointsStats", default: 10
    t.text "quests"
    t.text "questsDone"
    t.text "fights"
    t.integer "player"
    t.integer "imageId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enigmes", force: :cascade do |t|
    t.string "question"
    t.string "first_answer"
    t.string "second_answer"
    t.string "third_answer"
    t.string "fourth_answer"
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "nbItems"
    t.integer "gold", default: 500
    t.text "items"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price"
    t.integer "level"
    t.string "typeOfEquipment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oponents", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.integer "PV"
    t.integer "STR"
    t.integer "helmet"
    t.integer "weapon"
    t.integer "shield"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest", null: false
    t.integer "friends"
    t.integer "friendsBan"
    t.integer "friendsRequests"
    t.integer "conversations"
    t.integer "roles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pnjs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quests", force: :cascade do |t|
    t.integer "level"
    t.integer "XP"
    t.integer "gold"
    t.string "title"
    t.string "objective"
    t.integer "pnj"
    t.integer "enigme"
    t.integer "oponent"
    t.integer "imageId"
    t.integer "rewardId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_items", force: :cascade do |t|
    t.integer "idItem"
    t.string "name"
    t.integer "level"
    t.integer "price"
    t.integer "typeOfEquipment"
    t.integer "sellerId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
