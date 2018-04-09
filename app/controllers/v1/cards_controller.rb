class V1::CardsController < ApplicationController
  before_action :set_cards, only: [:show, :destroy]

  def index
    @cards = current_user.tables.find(params[:table_id])
             .lists.find(params[:list_id]).cards
    render :index, status: :ok
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = current_user.tables.find(params[:table_id])
            .lists.find(params[:list_id])
            .cards.build(card_params)
    @card.creator = current_user
    @card.save
    render :create, status: :created
  end

  def destroy
    if @card.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def set_cards
    @card = current_user.tables.find(params[:table_id])
            .lists.find(params[:list_id])
            .cards.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :description)
  end

end
