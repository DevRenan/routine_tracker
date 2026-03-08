class CreateFitnessWorkoutExercises < ActiveRecord::Migration[8.1]
  def change
    create_table :fitness_workout_exercises do |t|
      t.references :workout,
                   null: false,
                   foreign_key: { to_table: :fitness_workouts }

      t.references :gym_exercise,
                   null: false,
                   foreign_key: { to_table: :fitness_gym_exercises }

      t.integer :sets
      t.string :reps
      t.integer :rest_seconds
      t.integer :position

      t.timestamps
    end
  end
end