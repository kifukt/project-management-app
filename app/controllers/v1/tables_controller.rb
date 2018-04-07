class V1::TablesController < ApplicationController

  def index
    byebug
    @tables = Table.all

    render json: @tables, status: :ok
  end

end
