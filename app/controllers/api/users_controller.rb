# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: %i[show update destroy]

    def index
      @pagy, @users = pagy(User.all, page: params[:page] || 1)
      render json: { pagy: pagy_metadata(@pagy), users: @users }, status: :ok
    end

    def show
      user_data = @user.attributes.merge(
        role: @user.role,
        grade: @user.grade
      )
      render json: user_data, status: :ok
    end

    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def update
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
      head :no_content
    end

    private

    def set_user
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :not_found
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :profile_pic, :grade_id, :role_id)
    end
  end
end
