# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: { message: "Hello, #{current_user.username}!", role: current_user.role }, status: :ok
  end
end
