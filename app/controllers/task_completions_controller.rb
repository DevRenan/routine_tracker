class TaskCompletionsController < ApplicationController


  def index
    @tasks = Task.all

    today = Date.current

    # tasks já completadas hoje
    @completions_today = TaskCompletion
                           .where(date: Date.current)
                           .index_by(&:task_id)
    # score de hoje
    @today_score = TaskCompletion
                     .joins(:task)
                     .where(date: today)
                     .sum("tasks.score")

    # dados para gráfico
    @score_by_day = TaskCompletion
                      .joins(:task)
                      .group(:date)
                      .sum("tasks.score")

    @total_score = @tasks.sum(&:score)

    @progress =
      if @total_score > 0
        ((@today_score.to_f / @total_score) * 100).round
      else
        0
      end
  end
  def create
    @task_completion = TaskCompletion.find_or_create_by(
      task_id: params[:task_id],
      date: Date.current
    )

    redirect_to root_path
  end

  def destroy
    @task_completion = TaskCompletion.find(params[:id])
    @task_completion.destroy

    redirect_to root_path
  end

end
