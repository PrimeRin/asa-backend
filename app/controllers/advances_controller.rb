# frozen_string_literal: true

class AdvancesController < ApplicationController
  before_action :set_advance, only: [:show]

  # GET /advances
  def index
    @advances = Advance.all
    render json: @advances
  end

  # GET /advances/:id
  def show
    render json: @advance
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_advance
    @advance = Advance.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Advance not found' }, status: :not_found
  end
end
