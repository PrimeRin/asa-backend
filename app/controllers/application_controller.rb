# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def pagy_metadata(pagy)
    {
      page: pagy.page,
      items: pagy.items,
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
end
