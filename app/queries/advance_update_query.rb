# frozen_string_literal: true

class AdvanceUpdateQuery
  ADVANCE_STATUS_TYPE = %w[
    pending
    verified
    confirmed
    dispatched
    closed
  ].freeze

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
    @resource
  end

  private

  def run_query
    if @params[:status].present?
      case @params[:status]
      when 'approved'
        next_status = next_status(@resource.status)
        @resource.update(status: next_status, message: @params[:message], verified_by: @current_user.id)
      when 'rejected'
        @resource.update(status: 'rejected', message: @params[:message], confirmed_by: @current_user.id)
      else
        raise 'Invalid status'
      end
    else
      raise 'Status is required'
    end
  end

  def next_status(current_status)
    current_index = ADVANCE_STATUS_TYPE.index(current_status)
    if current_index.nil? || current_index >= ADVANCE_STATUS_TYPE.size - 1
      'closed'
    else
      ADVANCE_STATUS_TYPE[current_index + 1]
    end
  end
end
