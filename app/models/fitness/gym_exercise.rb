class Fitness::GymExercise < ApplicationRecord
  has_many :workout_exercises,
           class_name: "Fitness::WorkoutExercise",
           foreign_key: :gym_exercise_id,
           inverse_of: :gym_exercise,
           dependent: :destroy

  has_many :workouts,
           through: :workout_exercises,
           source: :workout
end