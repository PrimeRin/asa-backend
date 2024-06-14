# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resource :member, only: [:show]
  resources :advances, only: [:index, :show]
end
