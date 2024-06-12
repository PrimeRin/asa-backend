# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      if resource.id.nil?
        render json: { error: 'Invalid username or password.' }, status: :unauthorized
      else
        render json: { message: 'Signed in successfully.', user: resource }, status: :ok
      end
    end

    def respond_to_on_destroy
      render json: { message: 'Signed out successfully.' }, status: :ok
    end
  end
end
