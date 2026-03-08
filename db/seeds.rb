# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Limpa dados
Fitness::WorkoutExercise.destroy_all
Fitness::Workout.destroy_all
Fitness::GymExercise.destroy_all

# -------------------
# EXERCISES
# -------------------

exercises = {
  supino_reto: "Supino reto barra",
  supino_inclinado: "Supino inclinado halter",
  crucifixo: "Crucifixo máquina ou halter",
  paralelas: "Paralelas",
  triceps_testa: "Tríceps testa ou francês",
  triceps_corda: "Tríceps corda na polia",
  mergulho_banco: "Mergulho no banco",

  barra_fixa: "Barra fixa",
  remada_curvada: "Remada curvada barra",
  remada_unilateral: "Remada unilateral halter",
  pulldown: "Pulldown máquina",

  rosca_direta: "Rosca direta barra",
  rosca_alternada: "Rosca alternada halter",
  rosca_concentrada: "Rosca concentrada",

  agachamento: "Agachamento livre",
  leg_press: "Leg press",
  afundo: "Afundo andando ou búlgaro",
  stiff: "Stiff / RDL",
  mesa_flexora: "Mesa flexora",
  panturrilha: "Panturrilha em pé",

  desenvolvimento: "Desenvolvimento barra ou halter",
  elevacao_lateral: "Elevação lateral",
  elevacao_posterior: "Elevação lateral inclinada (posterior)",
  encolhimento: "Encolhimento trapézio",

  prancha: "Prancha",
  elevacao_pernas: "Elevação de pernas",
  ab_wheel: "Ab wheel"
}

gym = {}

exercises.each do |key, name|
  gym[key] = Fitness::GymExercise.create!(name: name)
end

# -------------------
# WORKOUT A
# -------------------

workout_a = Fitness::Workout.create!(name: "A – Peito + Tríceps")

[
  [:supino_reto, 4, "6-8", 180],
  [:supino_inclinado, 3, "8-10", 180],
  [:crucifixo, 3, "10-12", 120],
  [:paralelas, 3, "6-10", 180],

  [:triceps_testa, 3, "8-10", 120],
  [:triceps_corda, 3, "10-12", 120],
  [:mergulho_banco, 2, "falha", 120]

].each_with_index do |(exercise, sets, reps, rest), i|
  Fitness::WorkoutExercise.create!(
    workout: workout_a,
    gym_exercise: gym[exercise],
    sets: sets,
    reps: reps,
    rest_seconds: rest,
    position: i + 1
  )
end

# -------------------
# WORKOUT B
# -------------------

workout_b = Fitness::Workout.create!(name: "B – Costas + Bíceps")

[
  [:barra_fixa, 4, "6-8", 180],
  [:remada_curvada, 4, "6-8", 180],
  [:remada_unilateral, 3, "8-10", 150],
  [:pulldown, 3, "10-12", 120],

  [:rosca_direta, 3, "6-8", 120],
  [:rosca_alternada, 3, "8-10", 120],
  [:rosca_concentrada, 2, "10-12", 120]

].each_with_index do |(exercise, sets, reps, rest), i|
  Fitness::WorkoutExercise.create!(
    workout: workout_b,
    gym_exercise: gym[exercise],
    sets: sets,
    reps: reps,
    rest_seconds: rest,
    position: i + 1
  )
end

# -------------------
# WORKOUT C
# -------------------

workout_c = Fitness::Workout.create!(name: "C – Pernas")

[
  [:agachamento, 4, "5-8", 180],
  [:leg_press, 3, "8-10", 150],
  [:afundo, 3, "8-10", 150],

  [:stiff, 3, "6-8", 150],
  [:mesa_flexora, 3, "10-12", 120],

  [:panturrilha, 4, "12-15", 90]

].each_with_index do |(exercise, sets, reps, rest), i|
  Fitness::WorkoutExercise.create!(
    workout: workout_c,
    gym_exercise: gym[exercise],
    sets: sets,
    reps: reps,
    rest_seconds: rest,
    position: i + 1
  )
end

# -------------------
# WORKOUT D
# -------------------

workout_d = Fitness::Workout.create!(name: "D – Ombro + Core")

[
  [:desenvolvimento, 4, "6-8", 180],
  [:elevacao_lateral, 4, "10-12", 120],
  [:elevacao_posterior, 3, "12-15", 120],
  [:encolhimento, 3, "8-10", 120],

  [:prancha, 3, "30-60s", 90],
  [:elevacao_pernas, 3, "10-15", 90],
  [:ab_wheel, 3, "8-12", 90]

].each_with_index do |(exercise, sets, reps, rest), i|
  Fitness::WorkoutExercise.create!(
    workout: workout_d,
    gym_exercise: gym[exercise],
    sets: sets,
    reps: reps,
    rest_seconds: rest,
    position: i + 1
  )
end

tasks = [
  "1 hora de alongamento e preparação para começar o dia",
  "1 boa refeição de café da manhã",
  "1 boa refeição de almoço",
  "1 boa refeição jantar",
  "1 Treino de cardio ou musculação",
  "1 hora focado de trabalho/estudo",
  "1 hora focado de trabalho/estudo",
  "1 hora descanso (sem celular e sem computador)",
  "1 hora para atividades extras (Cuidado da casa ou resolver pendências)",
  "1 hora hobby (atividade lúdica sem telas)"
]

tasks.each do |task_name|
  Task.find_or_create_by!(name: task_name) do |task|
    task.score = 1
  end
end

puts "Seeds carregados com sucesso 💪"