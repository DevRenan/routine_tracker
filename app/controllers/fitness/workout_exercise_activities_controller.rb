class Fitness::WorkoutExerciseActivitiesController < ApplicationController
  before_action :set_fitness_workout_exercise_activity, only: %i[ show edit update destroy ]

  # GET /fitness/workout_exercise_activities or /fitness/workout_exercise_activities.json
  def index
    @fitness_workout_exercise_activities = Fitness::WorkoutExerciseActivity.all
  end

  # GET /fitness/workout_exercise_activities/1 or /fitness/workout_exercise_activities/1.json
  def show
  end

  # GET /fitness/workout_exercise_activities/new
  def new
    @fitness_workout_exercise_activity = Fitness::WorkoutExerciseActivity.new
  end

  # GET /fitness/workout_exercise_activities/1/edit
  def edit
  end

  # POST /fitness/workout_exercise_activities or /fitness/workout_exercise_activities.json
  def create
    @fitness_workout_exercise_activity = Fitness::WorkoutExerciseActivity.new(fitness_workout_exercise_activity_params)

    respond_to do |format|
      if @fitness_workout_exercise_activity.save
        format.html { redirect_to @fitness_workout_exercise_activity, notice: "Workout exercise activity was successfully created." }
        format.json { render :show, status: :created, location: @fitness_workout_exercise_activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fitness_workout_exercise_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fitness/workout_exercise_activities/1 or /fitness/workout_exercise_activities/1.json
  def update
    respond_to do |format|
      if @fitness_workout_exercise_activity.update(fitness_workout_exercise_activity_params)
        format.html { redirect_to @fitness_workout_exercise_activity, notice: "Workout exercise activity was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @fitness_workout_exercise_activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fitness_workout_exercise_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fitness/workout_exercise_activities/1 or /fitness/workout_exercise_activities/1.json
  def destroy
    @fitness_workout_exercise_activity.destroy!

    respond_to do |format|
      format.html { redirect_to fitness_workout_exercise_activities_path, notice: "Workout exercise activity was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fitness_workout_exercise_activity
      @fitness_workout_exercise_activity = Fitness::WorkoutExerciseActivity.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def fitness_workout_exercise_activity_params
      params.expect(fitness_workout_exercise_activity: [ :workout_activity_id, :workout_exercise_id, :gym_exercise_id, :notes ])
    end
end
