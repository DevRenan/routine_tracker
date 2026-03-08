class Fitness::Workout < ApplicationRecord
  has_many :workout_exercises,
           class_name: "Fitness::WorkoutExercise",
           dependent: :destroy

  has_many :gym_exercises,
           through: :workout_exercises
end