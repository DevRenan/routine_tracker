class Fitness::WorkoutExercise < ApplicationRecord
  belongs_to :workout,
             class_name: "Fitness::Workout",
             inverse_of: :workout_exercises

  belongs_to :gym_exercise,
             class_name: "Fitness::GymExercise",
             inverse_of: :workout_exercises

  default_scope { order(:position) }
end