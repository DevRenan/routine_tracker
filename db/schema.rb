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

ActiveRecord::Schema[8.1].define(version: 2026_03_07_205107) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "fitness_exercise_sets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "position"
    t.integer "reps"
    t.datetime "updated_at", null: false
    t.decimal "weight"
    t.bigint "workout_exercise_activity_id", null: false
    t.index ["workout_exercise_activity_id"], name: "index_fitness_exercise_sets_on_workout_exercise_activity_id"
  end

  create_table "fitness_gym_exercises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "muscle_group"
    t.string "name"
    t.datetime "updated_at", null: false
    t.string "url_video"
  end

  create_table "fitness_workout_activities", force: :cascade do |t|
    t.integer "calories"
    t.datetime "created_at", null: false
    t.datetime "finished_at"
    t.text "notes"
    t.datetime "started_at"
    t.datetime "updated_at", null: false
    t.bigint "workout_id", null: false
    t.index ["workout_id"], name: "index_fitness_workout_activities_on_workout_id"
  end

  create_table "fitness_workout_exercise_activities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "gym_exercise_id", null: false
    t.text "notes"
    t.datetime "updated_at", null: false
    t.bigint "workout_activity_id", null: false
    t.bigint "workout_exercise_id", null: false
    t.index ["gym_exercise_id"], name: "index_fitness_workout_exercise_activities_on_gym_exercise_id"
    t.index ["workout_activity_id"], name: "idx_on_workout_activity_id_22c3b2bc0d"
    t.index ["workout_exercise_id"], name: "idx_on_workout_exercise_id_56436616ff"
  end

  create_table "fitness_workout_exercises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "gym_exercise_id", null: false
    t.integer "position"
    t.string "reps"
    t.integer "rest_seconds"
    t.integer "sets"
    t.datetime "updated_at", null: false
    t.bigint "workout_id", null: false
    t.index ["gym_exercise_id"], name: "index_fitness_workout_exercises_on_gym_exercise_id"
    t.index ["workout_id"], name: "index_fitness_workout_exercises_on_workout_id"
  end

  create_table "fitness_workouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "task_completions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.bigint "task_id", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_task_completions_on_date"
    t.index ["task_id"], name: "index_task_completions_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "score"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fitness_exercise_sets", "fitness_workout_exercise_activities", column: "workout_exercise_activity_id"
  add_foreign_key "fitness_workout_activities", "fitness_workouts", column: "workout_id"
  add_foreign_key "fitness_workout_exercise_activities", "fitness_gym_exercises", column: "gym_exercise_id"
  add_foreign_key "fitness_workout_exercise_activities", "fitness_workout_activities", column: "workout_activity_id"
  add_foreign_key "fitness_workout_exercise_activities", "fitness_workout_exercises", column: "workout_exercise_id"
  add_foreign_key "fitness_workout_exercises", "fitness_gym_exercises", column: "gym_exercise_id"
  add_foreign_key "fitness_workout_exercises", "fitness_workouts", column: "workout_id"
  add_foreign_key "task_completions", "tasks"
end
