class V1::ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = current_user.tables.find(params[:table_id]).lists
    render :index, status: :ok
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.tables.find(params[:table_id]).lists.build(list_params)
    @list.creator = current_user
    @list.save
    render :create, status: :created
  end

  def destroy
    if @list.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def set_list
    @list = current_user.tables.find(params[:table_id]).lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
