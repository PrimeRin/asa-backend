# frozen_string_literal: true

class AdvanceQuery
  def self.call(params, current_user, resource)
    new(params, current_user, resource).run
  end

  def initialize(params, current_user, resource)
    @params = params
    @current_user = current_user
    @resource = resource
  end

  def run
    run_query
    search
    sort
    @resource
  end

  private

  def run_query
    @resource = if @params[:type] == 'my_advance'
                  @current_user.advances.where(status: @params[:status], advance_type: @params[:advance_type], deleted: false)
                elsif @params[:type] == 'claim_dsa'
                  Advance.where(status: @params[:status], advance_type: @params[:advance_type], claim_dsa: true, deleted: false)
                else
                  filter_by_status
                end
  end

  def filter_by_status
    case @current_user.role.name
    when 'Finance'
      Advance.where(status: finance_statuses, advance_type: @params[:advance_type], claim_dsa: nil, deleted: false)
    when 'DAF Director'
      Advance.where(status: director_statuses, advance_type: @params[:advance_type], claim_dsa: nil, deleted: false)
    else
      Advance.where(claim_dsa: nil)
    end
  end

  def search
    return unless @params[:query].present?

    @resource = @resource.joins(:user).where('users.username LIKE ?', "%#{@params[:query]}%")
  end

  def sort
    @resource = @resource.order(updated_at: :desc)
  end

  def finance_statuses
    return @params[:status] if @params[:status].present?

    %w[pending confirmed rejected dispatched]
  end

  def director_statuses
    return @params[:status] if @params[:status].present?

    %w[verified rejected dispatched]
  end
end
