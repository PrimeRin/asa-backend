# frozen_string_literal: true

module Api
  class PermissionsController < ApplicationController
    before_action :set_permission, only: %i[index update destroy]
    before_action :authenticate_user!

    def index
      render json: @permission, status: :ok
    end

    def create
      @permission = Permission.new(permission_params)

      if @permission.save
        render json: @permission, status: :created
      else
        render json: @permission.errors, status: :unprocessable_entity
      end
    end

    def update
      if @permission.update(permission_params)
        render json: @permission, status: :ok
      else
        render json: @permission.errors, status: :unprocessable_entity
      end
    end

    private

    def set_permission
      @permission = current_user.role.permissions
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Permission not found' }, status: :not_found
    end

    def permission_params
      params.require(:permission).permit(:resource, :actions, :role_id)
    end
  end
end
