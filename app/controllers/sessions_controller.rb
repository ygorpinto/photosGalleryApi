class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user&.valid_password?(params[:password])
      render json: user.authentication_token
    else
      head(:unauthorized)
    end
  end

  def destroy
    current_user&.authentication_token = nil
    if current_user.save
      head(:ok)
    else
      head(:unauthorized)
    end
  end
end