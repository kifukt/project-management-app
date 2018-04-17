class ApplicationController < ActionController::API
   acts_as_token_authentication_handler_for User, fallback: :none
   rescue_from ActiveRecord::RecordNotFound, with: :show_not_found_errors

   def show_not_found_errors
      render json: {error: "not_found"}, status: :not_found
   end
end
