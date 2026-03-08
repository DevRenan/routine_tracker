class CreateFitnessWorkouts < ActiveRecord::Migration[8.1]
  def change
    create_table :fitness_workouts do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
