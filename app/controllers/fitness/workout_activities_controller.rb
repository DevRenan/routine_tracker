class Fitness::WorkoutActivitiesController < ApplicationController
  before_action :set_fitness_workout_activity, only: %i[ show edit update destroy ]

  # GET /fitness/workout_activities or /fitness/workout_activities.json
  def index
    @fitness_workout_activities = Fitness::WorkoutActivity.all
  end

  # GET /fitness/workout_activities/1 or /fitness/workout_activities/1.json
  def show
  end

  # GET /fitness/workout_activities/new
  def new
    @fitness_workout_activity = Fitness::WorkoutActivity.new
  end

  # GET /fitness/workout_activities/1/edit
  def edit
  end

  # POST /fitness/workout_activities or /fitness/workout_activities.json
  def create
    @fitness_workout_activity = Fitness::WorkoutActivity.new(fitness_workout_activity_params)

    respond_to do |format|
      if @fitness_workout_activity.save
        format.html { redirect_to @fitness_workout_activity, notice: "Workout activity was successfully created." }
        format.json { render :show, status: :created, location: @fitness_workout_activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fitness_workout_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fitness/workout_activities/1 or /fitness/workout_activities/1.json
  def update
    respond_to do |format|
      if @fitness_workout_activity.update(fitness_workout_activity_params)
        format.html { redirect_to @fitness_workout_activity, notice: "Workout activity was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @fitness_workout_activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fitness_workout_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fitness/workout_activities/1 or /fitness/workout_activities/1.json
  def destroy
    @fitness_workout_activity.destroy!

    respond_to do |format|
      format.html { redirect_to fitness_workout_activities_path, notice: "Workout activity was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fitness_workout_activity
      @fitness_workout_activity = Fitness::WorkoutActivity.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def fitness_workout_activity_params
      params.expect(fitness_workout_activity: [ :workout_id, :started_at, :finished_at, :calories, :notes ])
    end
end
