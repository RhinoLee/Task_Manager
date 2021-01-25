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

ActiveRecord::Schema.define(version: 2021_01_25_012342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "task_lists", force: :cascade do |t|
    t.string "title"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "level"
    t.string "status"
    t.string "category"
    t.integer "position"
    t.bigint "task_lists_id"
    t.index ["task_lists_id"], name: "index_tasks_on_task_lists_id"
  end

  add_foreign_key "tasks", "task_lists", column: "task_lists_id"
end
