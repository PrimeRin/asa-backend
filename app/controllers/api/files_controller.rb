

module Api
  class FilesController < ApplicationController
    include UrlHelper
    before_action :authenticate_user!
    before_action :set_advance, only: %i[create]

    def create
      if files_attached?
        params[:files]&.each { |file| @advance.files.attach(file) }
      end
    end

    private
    def files_attached?
      params[:files].present? && params[:files].is_a?(Array)
    end
    def set_advance
      @advance = Advance.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Advance not found' }, status: :not_found
    end
  end
end
