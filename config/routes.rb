# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount ActionCable.server => '/cable'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  namespace :api do
    resources :advances, only: %i[index show create] do
      collection do
        get 'status_counts'
        get 'type_counts'
        get 'monthly_counts'
        post 'update_status'
      end
    end
    resources :notifications, only: [:create]
    resources :stop_over, only: [index]
    resources :files, only: %i[create]
    resources :permissions, only: %i[index]
    resources :itinerary, only: %i[index, show]
    resources :users, only: %i[index show update] do
      collection do
        post 'reset_password'
      end
    end
    resources :rates, only: %i[index update create] do
      collection do
        get :get_country_to
        get :mileage
        get :third_country
      end
    end
  end
  get '/test', to: 'test#status', as: :test_status
end
