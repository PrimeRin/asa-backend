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

  GLCODE = {
    'salary_advance': 1302004,
    'other_advance': 1302008,
    'tour_advance': 1302003, # tour advance
    'office tour': 4703001,
    'meeting/seminar': 4703002,
    'training': 4703003,
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
    generate_voucher if @resource.status == 'confirmed'
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
      elsif next_status == 'confirmed' && @resource.advance_percentage == 0.0 && @resource.claim_dsa == nil
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

  def generate_voucher
    if get_amount.to_i == 0 && !['in_country_dsa_claim', 'ex_country_dsa_claim'].include?(@resource.advance_type)
      return
    end
    
    vch_type = @resource.advance_type == 'salary_advance' ? 'Salary Advance' : 'other_advance'
    monthly_recovery_amount = 0
    from_date = nil
    to_date = nil
    loan_id = nil
  
    if @resource.advance_type == 'salary_advance'
      monthly_recovery_amount = @resource.salary_advance.deduction
      from_date = Date.today
      to_date = Date.today >> @resource.salary_advance.duration
      loan_id = 10012 
    end

    begin
      render json: { error: "There was clash with existing voucher. Please try again after few minutes." }, status: :unprocessable_entity
      # Icbs::VoucherGenerator.generate_voucher(
      #   txn_date: Date.today,
      #   txn_value_date: Date.today,
      #   particulars: @resource.message,
      #   vch_type: vch_type,
      #   created_by: username(@resource.dispatched_by),
      #   amount: get_amount.to_i,
      #   dr_gl_code: get_glcode,
      #   cr_gl_code: 1202002,
      #   emp_code: username(@resource.user_id),
      #   monthly_recovery_amount: monthly_recovery_amount,
      #   from_date: from_date,
      #   to_date: to_date,
      #   loan_id: loan_id
      # )
    rescue => e
      render json: { error: "There was clash with existing voucher. Please try again after few minutes." }, status: :unprocessable_entity
    end
  end
  

  def username(id)
    User.find(id).username
  end

  def get_amount
    case @resource.advance_type
    when 'salary_advance', 'other_advance'
      return @resource.amount
    when 'in_country_tour_advance'
      return @resource.advance_amount['Nu']
    when 'ex_country_tour_advance'
      return @resource.advance_amount['Nu'] + @resource.advance_amount['INR'] + @resource.advance_amount['USD']
    when 'in_country_dsa_claim'
      return @resource.dsa_amount['Nu']
    when 'ex_country_dsa_claim'
      return @resource.dsa_amount['Nu'] + @resource.dsa_amount['INR'] + @resource.dsa_amount['USD']
    end
  end

  def get_glcode
    if @resource.advance_type == 'in_country_tour_advance' || @resource.advance_type == 'ex_country_tour_advance'
      GLCODE[:tour_advance]
    else
      GLCODE[@resource.tour_type.to_sym]
    end
  end
end
