class Fitness::ExerciseSet < ApplicationRecord
  belongs_to :workout_exercise_activity,
             class_name: "Fitness::WorkoutExerciseActivity",
             inverse_of: :exercise_sets
end