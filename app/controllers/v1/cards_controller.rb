class V1::CardsController < ApplicationController
  before_action :set_cards, only: [:show, :destroy, :update]

  def index
    if List.find(params[:list_id]).table.user == current_user
      @cards = Lists.find(params[:list_id]).cards
      render :index, status: :ok
    else
      head(:forbidden)
    end
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    if Table.find(params[:table_id]).is_private
      @card = current_user.tables.find(params[:table_id])
              .lists.find(params[:list_id])
              .cards.build(card_params)
    else
      @card = current_user.groups.find(params[:group_id])
              .tables.find(params[:table_id])
              .lists.find(params[:list_id])
              .cards.build(card_params)
    end
    @card.creator = current_user
    if @card.save
      CardMailer.new_card(@card)
    end
    render :create, status: :created
  end

  def destroy
    if @card.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  def update
    if @card.update(card_params)
      render :update, status: :ok
    else
      head(:unauthorized)
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
