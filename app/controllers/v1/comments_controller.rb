class V1::CommentsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @comments = current_user.tables.find(params[:table_id])
                .lists.find(params[:list_id])
                .cards.find(params[:card_id])
                .comments
    render :index, status: :ok
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.tables.find(params[:table_id])
               .lists.find(params[:list_id])
               .cards.find(params[:card_id])
               .comments.build(comment_params)
    @comment.creator = current_user
    @comment.save
    render :create, status: :created
  end

  def destroy
    if @comment.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def set_list
    @comment = current_user.tables.find(params[:table_id])
               .lists.find(params[:list_id])
               .cards.find(params[:card_id])
               .comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
