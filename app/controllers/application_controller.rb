# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?

  def pagy_metadata(pagy)
    {
      page: pagy.page,
      pages: pagy.pages,
      count: pagy.count,
      prev: pagy.prev,
      next: pagy.next,
      offset: pagy.offset
    }
  end

  protected

  def configure_permitted_parameters
    # added_attrs = [:username, :email, :password, :password_confirmation, :role]
    # devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: %i[login password]
    # devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def authenticate_user!
    auth_header = request.headers['Authorization']

    if auth_header.present?
      token = auth_header.split(' ').last
      decoded_token = JwtService.decode(token)
      @current_user = User.find_by(id: decoded_token&.fetch(:user_id))
      head :unauthorized unless @current_user
    else
      head :unauthorized
    end
  end
end
