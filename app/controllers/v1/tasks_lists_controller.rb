class V1::TasksListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @tasks_lists = current_user.tables.find(params[:table_id])
                .lists.find(params[:list_id])
                .cards.find(params[:card_id]).tasks_lists
    render :index, status: :ok
  end

  def show
  end

  def new
    @tasks_list = TasksList.new
  end

  def create
    @tasks_list = current_user.tables.find(params[:table_id])
               .lists.find(params[:list_id])
               .cards.find(params[:card_id])
               .tasks_lists.build(tasks_list_params)
    @tasks_list.creator = current_user
    @tasks_list.save
    render :create, status: :created
  end

  def destroy
    if @tasks_list.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def set_list
    @tasks_list = current_user.tables.find(params[:table_id])
               .lists.find(params[:list_id])
               .cards.find(params[:card_id])
               .tasks_lists.find(params[:id])
  end

  def tasks_list_params
    params.require(:tasks_list).permit(:name)
  end

end
