# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :sessions, only: [:create, :destroy]
  resource :users, only: [:create, :update, :destroy]
end
