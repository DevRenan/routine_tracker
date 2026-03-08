require "test_helper"

class Fitness::WorkoutExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fitness_workout_exercise = fitness_workout_exercises(:one)
  end

  test "should get index" do
    get fitness_workout_exercises_url
    assert_response :success
  end

  test "should get new" do
    get new_fitness_workout_exercise_url
    assert_response :success
  end

  test "should create fitness_workout_exercise" do
    assert_difference("Fitness::WorkoutExercise.count") do
      post fitness_workout_exercises_url, params: { fitness_workout_exercise: { gym_exercise_id: @fitness_workout_exercise.gym_exercise_id, position: @fitness_workout_exercise.position, reps: @fitness_workout_exercise.reps, rest_seconds: @fitness_workout_exercise.rest_seconds, sets: @fitness_workout_exercise.sets, workout_id: @fitness_workout_exercise.workout_id } }
    end

    assert_redirected_to fitness_workout_exercise_url(Fitness::WorkoutExercise.last)
  end

  test "should show fitness_workout_exercise" do
    get fitness_workout_exercise_url(@fitness_workout_exercise)
    assert_response :success
  end

  test "should get edit" do
    get edit_fitness_workout_exercise_url(@fitness_workout_exercise)
    assert_response :success
  end

  test "should update fitness_workout_exercise" do
    patch fitness_workout_exercise_url(@fitness_workout_exercise), params: { fitness_workout_exercise: { gym_exercise_id: @fitness_workout_exercise.gym_exercise_id, position: @fitness_workout_exercise.position, reps: @fitness_workout_exercise.reps, rest_seconds: @fitness_workout_exercise.rest_seconds, sets: @fitness_workout_exercise.sets, workout_id: @fitness_workout_exercise.workout_id } }
    assert_redirected_to fitness_workout_exercise_url(@fitness_workout_exercise)
  end

  test "should destroy fitness_workout_exercise" do
    assert_difference("Fitness::WorkoutExercise.count", -1) do
      delete fitness_workout_exercise_url(@fitness_workout_exercise)
    end

    assert_redirected_to fitness_workout_exercises_url
  end
end
