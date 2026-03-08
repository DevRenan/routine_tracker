require "test_helper"

class Fitness::ExerciseSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fitness_exercise_set = fitness_exercise_sets(:one)
  end

  test "should get index" do
    get fitness_exercise_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_fitness_exercise_set_url
    assert_response :success
  end

  test "should create fitness_exercise_set" do
    assert_difference("Fitness::ExerciseSet.count") do
      post fitness_exercise_sets_url, params: { fitness_exercise_set: { position: @fitness_exercise_set.position, reps: @fitness_exercise_set.reps, weight: @fitness_exercise_set.weight, workout_exercise_activity_id: @fitness_exercise_set.workout_exercise_activity_id } }
    end

    assert_redirected_to fitness_exercise_set_url(Fitness::ExerciseSet.last)
  end

  test "should show fitness_exercise_set" do
    get fitness_exercise_set_url(@fitness_exercise_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_fitness_exercise_set_url(@fitness_exercise_set)
    assert_response :success
  end

  test "should update fitness_exercise_set" do
    patch fitness_exercise_set_url(@fitness_exercise_set), params: { fitness_exercise_set: { position: @fitness_exercise_set.position, reps: @fitness_exercise_set.reps, weight: @fitness_exercise_set.weight, workout_exercise_activity_id: @fitness_exercise_set.workout_exercise_activity_id } }
    assert_redirected_to fitness_exercise_set_url(@fitness_exercise_set)
  end

  test "should destroy fitness_exercise_set" do
    assert_difference("Fitness::ExerciseSet.count", -1) do
      delete fitness_exercise_set_url(@fitness_exercise_set)
    end

    assert_redirected_to fitness_exercise_sets_url
  end
end
