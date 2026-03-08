require "test_helper"

class Fitness::WorkoutExerciseActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fitness_workout_exercise_activity = fitness_workout_exercise_activities(:one)
  end

  test "should get index" do
    get fitness_workout_exercise_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_fitness_workout_exercise_activity_url
    assert_response :success
  end

  test "should create fitness_workout_exercise_activity" do
    assert_difference("Fitness::WorkoutExerciseActivity.count") do
      post fitness_workout_exercise_activities_url, params: { fitness_workout_exercise_activity: { gym_exercise_id: @fitness_workout_exercise_activity.gym_exercise_id, notes: @fitness_workout_exercise_activity.notes, workout_activity_id: @fitness_workout_exercise_activity.workout_activity_id, workout_exercise_id: @fitness_workout_exercise_activity.workout_exercise_id } }
    end

    assert_redirected_to fitness_workout_exercise_activity_url(Fitness::WorkoutExerciseActivity.last)
  end

  test "should show fitness_workout_exercise_activity" do
    get fitness_workout_exercise_activity_url(@fitness_workout_exercise_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_fitness_workout_exercise_activity_url(@fitness_workout_exercise_activity)
    assert_response :success
  end

  test "should update fitness_workout_exercise_activity" do
    patch fitness_workout_exercise_activity_url(@fitness_workout_exercise_activity), params: { fitness_workout_exercise_activity: { gym_exercise_id: @fitness_workout_exercise_activity.gym_exercise_id, notes: @fitness_workout_exercise_activity.notes, workout_activity_id: @fitness_workout_exercise_activity.workout_activity_id, workout_exercise_id: @fitness_workout_exercise_activity.workout_exercise_id } }
    assert_redirected_to fitness_workout_exercise_activity_url(@fitness_workout_exercise_activity)
  end

  test "should destroy fitness_workout_exercise_activity" do
    assert_difference("Fitness::WorkoutExerciseActivity.count", -1) do
      delete fitness_workout_exercise_activity_url(@fitness_workout_exercise_activity)
    end

    assert_redirected_to fitness_workout_exercise_activities_url
  end
end
