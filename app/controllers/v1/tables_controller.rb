class V1::TablesController < ApplicationController
  before_action :set_table, only: [:show, :destroy]

  def index
    @tables = current_user.tables
    render :index, status: :ok
  end

  def show
  end

  def new
    @table = Table.new
  end

  def create
    @table = current_user.tables.build(table_params)
    @table.creator = current_user
    @table.save
    render :create, status: :created
  end

  def destroy
    if @table.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def set_table
    @table = current_user.tables.find(params[:id])
  end

  def table_params
    params.require(:table).permit(:name)
  end

end
