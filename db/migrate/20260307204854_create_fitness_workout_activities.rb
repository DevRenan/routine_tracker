class CreateFitnessWorkoutActivities < ActiveRecord::Migration[8.1]
  def change
    create_table :fitness_workout_activities do |t|
      t.references :workout, null: false, foreign_key: { to_table: :fitness_workouts }
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :calories
      t.text :notes

      t.timestamps
    end
  end
end
