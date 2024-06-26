# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    def create
      user = User.authenticate(params[:user][:login], params[:user][:password])
      if user
        sign_in(resource_name, user)
        yield user if block_given?
        token = JwtService.encode({ user_id: user.id })
        render json: { token: token }, status: :ok
      else
        render json: { error: 'Invalid username or password.' }, status: :unauthorized
      end
    end

    private

    def respond_with(resource, _opts = {})
      if resource&.id
        render json: { message: 'Signed in successfully.', user: resource }, status: :ok
      else
        render json: { error: 'Invalid username or password.' }, status: :unauthorized
      end
    end

    def respond_to_on_destroy
      render json: { message: 'Signed out successfully.' }, status: :ok
    end
  end
end
