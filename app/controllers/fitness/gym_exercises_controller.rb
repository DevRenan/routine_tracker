class Fitness::GymExercisesController < ApplicationController
  before_action :set_fitness_gym_exercise, only: %i[ show edit update destroy ]

  # GET /fitness/gym_exercises or /fitness/gym_exercises.json
  def index
    @fitness_gym_exercises = Fitness::GymExercise.all
  end

  # GET /fitness/gym_exercises/1 or /fitness/gym_exercises/1.json
  def show
  end

  # GET /fitness/gym_exercises/new
  def new
    @fitness_gym_exercise = Fitness::GymExercise.new
  end

  # GET /fitness/gym_exercises/1/edit
  def edit
  end

  # POST /fitness/gym_exercises or /fitness/gym_exercises.json
  def create
    @fitness_gym_exercise = Fitness::GymExercise.new(fitness_gym_exercise_params)

    respond_to do |format|
      if @fitness_gym_exercise.save
        format.html { redirect_to @fitness_gym_exercise, notice: "Gym exercise was successfully created." }
        format.json { render :show, status: :created, location: @fitness_gym_exercise }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fitness_gym_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fitness/gym_exercises/1 or /fitness/gym_exercises/1.json
  def update
    respond_to do |format|
      if @fitness_gym_exercise.update(fitness_gym_exercise_params)
        format.html { redirect_to @fitness_gym_exercise, notice: "Gym exercise was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @fitness_gym_exercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fitness_gym_exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fitness/gym_exercises/1 or /fitness/gym_exercises/1.json
  def destroy
    @fitness_gym_exercise.destroy!

    respond_to do |format|
      format.html { redirect_to fitness_gym_exercises_path, notice: "Gym exercise was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fitness_gym_exercise
      @fitness_gym_exercise = Fitness::GymExercise.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def fitness_gym_exercise_params
      params.expect(fitness_gym_exercise: [ :name, :description, :url_video, :muscle_group ])
    end
end
