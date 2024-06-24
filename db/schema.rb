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

ActiveRecord::Schema[7.1].define(version: 2024_06_24_075631) do
  create_table "assignments", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "subject_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_assignments_on_student_id"
    t.index ["subject_id"], name: "index_assignments_on_subject_id"
  end

  create_table "exams", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "subject_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_exams_on_student_id"
    t.index ["subject_id"], name: "index_exams_on_subject_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "subject_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_quizzes_on_student_id"
    t.index ["subject_id"], name: "index_quizzes_on_subject_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "subject_id", null: false
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_ranks_on_student_id"
    t.index ["subject_id"], name: "index_ranks_on_subject_id"
  end

  create_table "scores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.integer "subject_id"
    t.integer "score"
    t.index ["student_id"], name: "index_scores_on_student_id"
    t.index ["subject_id"], name: "index_scores_on_subject_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "assignments", "students"
  add_foreign_key "assignments", "subjects"
  add_foreign_key "exams", "students"
  add_foreign_key "exams", "subjects"
  add_foreign_key "quizzes", "students"
  add_foreign_key "quizzes", "subjects"
  add_foreign_key "ranks", "students"
  add_foreign_key "ranks", "subjects"
end
