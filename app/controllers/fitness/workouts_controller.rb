class Fitness::WorkoutsController < ApplicationController
  before_action :set_fitness_workout, only: %i[ show edit update destroy ]

  # GET /fitness/workouts or /fitness/workouts.json
  def index
    @fitness_workouts = Fitness::Workout.all
  end

  # GET /fitness/workouts/1 or /fitness/workouts/1.json
  def show
    @workout = Fitness::Workout.find(params[:id])
    @workout_exercises = @workout.workout_exercises.includes(:gym_exercise)
  end

  # GET /fitness/workouts/new
  def new
    @fitness_workout = Fitness::Workout.new
  end

  # GET /fitness/workouts/1/edit
  def edit
  end

  # POST /fitness/workouts or /fitness/workouts.json
  def create
    @fitness_workout = Fitness::Workout.new(fitness_workout_params)

    respond_to do |format|
      if @fitness_workout.save
        format.html { redirect_to @fitness_workout, notice: "Workout was successfully created." }
        format.json { render :show, status: :created, location: @fitness_workout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fitness_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fitness/workouts/1 or /fitness/workouts/1.json
  def update
    respond_to do |format|
      if @fitness_workout.update(fitness_workout_params)
        format.html { redirect_to @fitness_workout, notice: "Workout was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @fitness_workout }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fitness_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fitness/workouts/1 or /fitness/workouts/1.json
  def destroy
    @fitness_workout.destroy!

    respond_to do |format|
      format.html { redirect_to fitness_workouts_path, notice: "Workout was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fitness_workout
      @fitness_workout = Fitness::Workout.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def fitness_workout_params
      params.expect(fitness_workout: [ :name, :description ])
    end
end
