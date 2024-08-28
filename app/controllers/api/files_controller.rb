module Api
  class FilesController < ApplicationController
    include UrlHelper
    before_action :authenticate_user!
    before_action :set_advance, only: %i[create update destroy]

    def create
      if files_attached?
        params[:files]&.each { |file| @advance.files.attach(file) }
        render status: :created
      else
        render status: :ok
      end
    end

    def update
      if files_attached?
        # Optionally, detach existing files before attaching new ones
        @advance.files.purge if params[:purge_existing]

        params[:files]&.each { |file| @advance.files.attach(file) }
        render status: :ok
      else
        render status: :unprocessable_entity
      end
    end

    def destroy
      if params[:file_id].is_a?(Array)
        files = @advance.files.where(id: params[:file_id])
    
        if files.present?
          files.each(&:purge)
          render json: { message: 'Files deleted successfully' }, status: :ok
        else
          render json: { error: 'Files not found' }, status: :ok
        end
      else
        render json: { error: 'Invalid file_id parameter. It should be an array of file IDs.' }, status: :unprocessable_entity
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
