class CreateFitnessGymExercises < ActiveRecord::Migration[8.1]
  def change
    create_table :fitness_gym_exercises do |t|
      t.string :name
      t.text :description
      t.string :url_video
      t.string :muscle_group

      t.timestamps
    end
  end
end
