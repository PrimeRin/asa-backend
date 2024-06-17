# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  namespace :api do
    resources :advances, only: %i[index show create]
    resources :permissions, only: %i[index]
    resources :rates, only: %i[index update create] do
      collection do
        get :get_country
      end
    end
  end
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
end
