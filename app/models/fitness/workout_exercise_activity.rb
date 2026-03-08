class Fitness::WorkoutExerciseActivity < ApplicationRecord
  belongs_to :workout_activity,
             class_name: "Fitness::WorkoutActivity",
             inverse_of: :workout_exercise_activities

  belongs_to :workout_exercise,
             class_name: "Fitness::WorkoutExercise",
             inverse_of: :workout_exercise_activities

  belongs_to :gym_exercise,
             class_name: "Fitness::GymExercise"

  has_many :exercise_sets,
           class_name: "Fitness::ExerciseSet",
           foreign_key: :workout_exercise_activity_id,
           dependent: :destroy,
           inverse_of: :workout_exercise_activity
end