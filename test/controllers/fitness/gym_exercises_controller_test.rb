require "test_helper"

class Fitness::GymExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fitness_gym_exercise = fitness_gym_exercises(:one)
  end

  test "should get index" do
    get fitness_gym_exercises_url
    assert_response :success
  end

  test "should get new" do
    get new_fitness_gym_exercise_url
    assert_response :success
  end

  test "should create fitness_gym_exercise" do
    assert_difference("Fitness::GymExercise.count") do
      post fitness_gym_exercises_url, params: { fitness_gym_exercise: { description: @fitness_gym_exercise.description, muscle_group: @fitness_gym_exercise.muscle_group, name: @fitness_gym_exercise.name, url_video: @fitness_gym_exercise.url_video } }
    end

    assert_redirected_to fitness_gym_exercise_url(Fitness::GymExercise.last)
  end

  test "should show fitness_gym_exercise" do
    get fitness_gym_exercise_url(@fitness_gym_exercise)
    assert_response :success
  end

  test "should get edit" do
    get edit_fitness_gym_exercise_url(@fitness_gym_exercise)
    assert_response :success
  end

  test "should update fitness_gym_exercise" do
    patch fitness_gym_exercise_url(@fitness_gym_exercise), params: { fitness_gym_exercise: { description: @fitness_gym_exercise.description, muscle_group: @fitness_gym_exercise.muscle_group, name: @fitness_gym_exercise.name, url_video: @fitness_gym_exercise.url_video } }
    assert_redirected_to fitness_gym_exercise_url(@fitness_gym_exercise)
  end

  test "should destroy fitness_gym_exercise" do
    assert_difference("Fitness::GymExercise.count", -1) do
      delete fitness_gym_exercise_url(@fitness_gym_exercise)
    end

    assert_redirected_to fitness_gym_exercises_url
  end
end
