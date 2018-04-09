class V1::TasksController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @tasks = current_user.tables.find(params[:table_id])
                .lists.find(params[:list_id])
                .cards.find(params[:card_id])
                .tasks_lists.find(params[:tasks_list_id])
                .tasks
    render :index, status: :ok
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tables.find(params[:table_id])
               .lists.find(params[:list_id])
               .cards.find(params[:card_id])
               .tasks_lists.find(params[:tasks_list_id])
               .tasks.build(task_params)
    @task.creator = current_user
    @task.save
    render :create, status: :created
  end

  def destroy
    if @task.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private
  def set_list
    @task = current_user.tables.find(params[:table_id])
               .lists.find(params[:list_id])
               .cards.find(params[:card_id])
               .tasks_lists.find(params[:tasks_list_id])
               .tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content, :assigned_to)
  end

end
