class V1::SessionsController < ApplicationController
  def show
    current_user ? head(:ok) : head(:unauthorized)
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user&.valid_password?(params[:password])
      render :create, status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
    if delete_token && current_user.save
      head(:ok)
    else
      head(:unauthorized)
    end
  end

  private

  def delete_token
    current_user&.authentication_token = nil
  end
end
