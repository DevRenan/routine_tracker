class Fitness::ExerciseSetsController < ApplicationController
  before_action :set_fitness_exercise_set, only: %i[ show edit update destroy ]

  # GET /fitness/exercise_sets or /fitness/exercise_sets.json
  def index
    @fitness_exercise_sets = Fitness::ExerciseSet.all
  end

  # GET /fitness/exercise_sets/1 or /fitness/exercise_sets/1.json
  def show
  end

  # GET /fitness/exercise_sets/new
  def new
    @fitness_exercise_set = Fitness::ExerciseSet.new
  end

  # GET /fitness/exercise_sets/1/edit
  def edit
  end

  # POST /fitness/exercise_sets or /fitness/exercise_sets.json
  def create
    @fitness_exercise_set = Fitness::ExerciseSet.new(fitness_exercise_set_params)

    respond_to do |format|
      if @fitness_exercise_set.save
        format.html { redirect_to @fitness_exercise_set, notice: "Exercise set was successfully created." }
        format.json { render :show, status: :created, location: @fitness_exercise_set }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fitness_exercise_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fitness/exercise_sets/1 or /fitness/exercise_sets/1.json
  def update
    respond_to do |format|
      if @fitness_exercise_set.update(fitness_exercise_set_params)
        format.html { redirect_to @fitness_exercise_set, notice: "Exercise set was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @fitness_exercise_set }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fitness_exercise_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fitness/exercise_sets/1 or /fitness/exercise_sets/1.json
  def destroy
    @fitness_exercise_set.destroy!

    respond_to do |format|
      format.html { redirect_to fitness_exercise_sets_path, notice: "Exercise set was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fitness_exercise_set
      @fitness_exercise_set = Fitness::ExerciseSet.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def fitness_exercise_set_params
      params.expect(fitness_exercise_set: [ :workout_exercise_activity_id, :reps, :weight, :position ])
    end
end
