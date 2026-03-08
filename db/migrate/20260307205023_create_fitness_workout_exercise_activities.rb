class CreateFitnessWorkoutExerciseActivities < ActiveRecord::Migration[8.1]
  def change
    create_table :fitness_workout_exercise_activities do |t|
      t.references :workout_activity, null: false, foreign_key: { to_table: :fitness_workout_activities }
      t.references :workout_exercise, null: false, foreign_key: { to_table: :fitness_workout_exercises }
      t.references :gym_exercise, null: false, foreign_key: { to_table: :fitness_gym_exercises }
      t.text :notes

      t.timestamps
    end
  end
end
