# frozen_string_literal: true

class AdvanceQuery
  def self.call(params, current_user, resource)
    new(params, current_user, resource)
  end

  def initialize(params, current_user, resource)
    @params = params
    @current_user = current_user
    @resource = resource
  end

  def run
    run_query
    sort
    @resource
  end

  private

  def run_query
    @resource = if @params[:type] == 'my_advance'
                  @current_user.advances.where(status: @params[:status], advance_type: @params[:advance_type])
                else
                  Advance.where(status: @params[:status], advance_type: @params[:advance_type])
                end
  end

  def search; end

  def sort
    @resource = @resource.order(updated_at: :desc)
  end
end
