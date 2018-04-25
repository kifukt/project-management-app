class V1::UsersController < ApplicationController
  before_action :set_user, only: [:update]

  def create
    @user = User.new(user_params)
    if @user.save
      render :create
    else
      head(:unprocessable_entity)
    end
  end

  def update
    if @user.update(user_params)
      render :update, status: :ok
    else
      head(:unauthorized)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
