# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  namespace :api do
    resources :advances, only: %i[index show create] do
      collection do
        get 'status_counts'
        get 'type_counts'
        get 'monthly_counts'
      end
    end
    resources :permissions, only: %i[index]
    resources :users, only: %i[index show update]
    resources :rates, only: %i[index update create] do
      collection do
        get :get_country
      end
    end
  end
  get '/test', to: 'test#status', as: :test_status
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
end
