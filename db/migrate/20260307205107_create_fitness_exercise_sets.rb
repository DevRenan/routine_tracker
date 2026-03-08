class CreateFitnessExerciseSets < ActiveRecord::Migration[8.1]
  def change
    create_table :fitness_exercise_sets do |t|
      t.references :workout_exercise_activity, null: false, foreign_key: { to_table: :fitness_workout_exercise_activities }
      t.integer :reps
      t.decimal :weight
      t.integer :position

      t.timestamps
    end
  end
end
