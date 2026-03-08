class Fitness::WorkoutActivity < ApplicationRecord
  belongs_to :workout,
             class_name: "Fitness::Workout",
             inverse_of: :workout_activities

  has_many :workout_exercise_activities,
           class_name: "Fitness::WorkoutExerciseActivity",
           foreign_key: :workout_activity_id,
           dependent: :destroy,
           inverse_of: :workout_activity
end