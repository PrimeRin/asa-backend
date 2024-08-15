# frozen_string_literal: true

class AdvanceUpdateQuery
  ADVANCE_STATUS_TYPE = %w[
    pending
    verified
    confirmed
    dispatched
    closed
  ].freeze

  PREFIX_DISPATCH = {
    'salary_advance': 'SA',
    'other_advance': 'OA',
    'in_country_tour_advance': 'TA',
    'ex_country_tour_advance': 'TA',
    'dsa_claim': 'DSA',
  }.freeze

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
    raise 'Status is required' unless @params[:status].present?

    case @params[:status]
    when 'approved'
      next_status = next_status(@resource.status)
      @resource.update(status: next_status, message: @params[:message], "#{next_status}_by": @current_user.id)
      if next_status == 'dispatched'
        generate_dispatched_ref
      elsif next_status == 'confirmed' && @resource.advance_percentage == '0.0'
        @resource.update(status: "dispatched")
        generate_dispatched_ref
      end
    when 'rejected'
      @resource.update(status: 'rejected', message: @params[:message], rejected_by: @current_user.id)
    else
      raise 'Invalid status'
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

  def generate_dispatched_ref
    year = Time.current.year
    month = Time.current.month.to_s.rjust(2, '0')

    if @resource.claim_dsa
      prefix = PREFIX_DISPATCH[:dsa_claim]
      reference_key = 'dsa_claim_ref'
    else
      prefix = PREFIX_DISPATCH[@resource.advance_type.to_sym]
      reference_key = 'advance_ref'
    end
    reference = "#{prefix}/#{year}/#{month}/#{@resource.id}"
    existing_ref = @resource.dispatched_ref || {}
    updated_ref = existing_ref.merge(reference_key => reference)
    @resource.update(dispatched_ref: updated_ref)
  end
end
