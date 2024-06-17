# frozen_string_literal: true

module Api
  class AdvancesController < ApplicationController
    before_action :set_advance, only: [:show]

    def index
      @pagy, @advances = pagy(AdvanceQuery.call(params[:advance], current_user, Advance.all).run,
                              page: params[:page] || 1)
      render json: { pagy: pagy_metadata(@pagy), advances: @advances }, status: :ok
    end

    def show
      render json: @advance
    end

    def create
      @advance = current_user.advances.new(advance_params)

      if @advance.save
        render json: @advance, status: :created
      else
        render json: @advance.errors, status: :unprocessable_entity
      end
    end

    private

    def create_iternary; end

    def create_attachment; end

    def set_advance
      @advance = Advance.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Advance not found' }, status: :not_found
    end

    def advance_params
      params.require(:advance).permit(:advance_type, :status, :amount)
    end
  end
end
