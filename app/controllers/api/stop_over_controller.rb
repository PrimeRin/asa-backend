
module Api
  class StopOverController < ApplicationController
    before_action :authenticate_user!

    def index
      rate = StopOverRate.find_by(value: stop_over_params[:value], country: stop_over_params[:country])
      render json: rate, status: :ok
    end

    private
    def stop_over_params
      params.require(:stop_over_rate).permit(:value, :country,)
    end
  end
end
