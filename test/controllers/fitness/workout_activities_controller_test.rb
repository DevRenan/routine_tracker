require "test_helper"

class Fitness::WorkoutActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fitness_workout_activity = fitness_workout_activities(:one)
  end

  test "should get index" do
    get fitness_workout_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_fitness_workout_activity_url
    assert_response :success
  end

  test "should create fitness_workout_activity" do
    assert_difference("Fitness::WorkoutActivity.count") do
      post fitness_workout_activities_url, params: { fitness_workout_activity: { calories: @fitness_workout_activity.calories, finished_at: @fitness_workout_activity.finished_at, notes: @fitness_workout_activity.notes, started_at: @fitness_workout_activity.started_at, workout_id: @fitness_workout_activity.workout_id } }
    end

    assert_redirected_to fitness_workout_activity_url(Fitness::WorkoutActivity.last)
  end

  test "should show fitness_workout_activity" do
    get fitness_workout_activity_url(@fitness_workout_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_fitness_workout_activity_url(@fitness_workout_activity)
    assert_response :success
  end

  test "should update fitness_workout_activity" do
    patch fitness_workout_activity_url(@fitness_workout_activity), params: { fitness_workout_activity: { calories: @fitness_workout_activity.calories, finished_at: @fitness_workout_activity.finished_at, notes: @fitness_workout_activity.notes, started_at: @fitness_workout_activity.started_at, workout_id: @fitness_workout_activity.workout_id } }
    assert_redirected_to fitness_workout_activity_url(@fitness_workout_activity)
  end

  test "should destroy fitness_workout_activity" do
    assert_difference("Fitness::WorkoutActivity.count", -1) do
      delete fitness_workout_activity_url(@fitness_workout_activity)
    end

    assert_redirected_to fitness_workout_activities_url
  end
end
