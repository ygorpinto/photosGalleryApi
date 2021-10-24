# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    user = User.new(create_params)
    user.save!
  end

  def update
    user = User.find(user_id)
    user.email = params[:email] if params[:email].present?
    user.password = params[:password] if params[:password].present?
    user.save!
  end

  def destroy
    user = User.find(user_id)
    if user&.valid_password?(params[:password])
      user.destroy!
    else
      head(:unauthorized)
    end
  end

  protected

  def user_id
    params[:id]
  end

  def create_params
    {
      email: params[:email],
      password: params[:password]
    }
  end
end
