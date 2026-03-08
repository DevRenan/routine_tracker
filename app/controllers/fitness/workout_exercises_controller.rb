class Fitness::WorkoutExercisesController < ApplicationController
  before_action :set_fitness_workout_exercise, only: %i[ show edit update destroy ]

  # GET /fitness/workout_exercises or /fitness/workout_exercises.json
  def index
    @fitness_workout_exercises = Fitness::WorkoutExercise.all
  end

  # GET /fitness/workout_exercises/1 or /fitness/workout_exercises/1.json
  def show
  end

  # GET /fitness/workout_exercises/new
  def new
    @fitness_workout_exercise = Fitness::WorkoutExercise.new
  end

  # GET /fitness/workout_exercises/1/edit
  def edit
  end

  # POST /fitness/workout_exercises or /fitness/workout_exercises.json
  def create
    @fitness_workout_exercise = Fitness::WorkoutExercise.new(fitness_workout_exercise_params)

    respond_to do |format|
      if @fitness_workout_exercise.save
        format.html { redirect_to @fitness_workout_exercise, notice: "Workout exercise was successfully created." }
        format.json { render :show, status: :created, location: @fitness_workout_exercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fitness_workout_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fitness/workout_exercises/1 or /fitness/workout_exercises/1.json
  def update
    respond_to do |format|
      if @fitness_workout_exercise.update(fitness_workout_exercise_params)
        format.html { redirect_to @fitness_workout_exercise, notice: "Workout exercise was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @fitness_workout_exercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fitness_workout_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fitness/workout_exercises/1 or /fitness/workout_exercises/1.json
  def destroy
    @fitness_workout_exercise.destroy!

    respond_to do |format|
      format.html { redirect_to fitness_workout_exercises_path, notice: "Workout exercise was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fitness_workout_exercise
      @fitness_workout_exercise = Fitness::WorkoutExercise.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def fitness_workout_exercise_params
      params.expect(fitness_workout_exercise: [ :workout_id, :gym_exercise_id, :sets, :reps, :rest_seconds, :position ])
    end
end
