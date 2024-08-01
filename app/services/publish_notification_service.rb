# frozen_string_literal: true

class PublishNotificationService
  ADVANCE_TYPE = {
    'salary_advance' => 'Salary Advance',
    'other_advance' => 'Other Advance',
    'in_country_tour_advance' => 'In Country Tour Advance',
    'ex_country_tour_advance' => 'Ex Country Tour Advance'
  }.freeze

  DSA_TYPE = {
    'in_country_tour_advance' => 'In Country DSA Claim',
    'ex_country_tour_advance' => 'Ex Country DSA Claim'
  }.freeze
  def initialize(current_user, advance)
    @current_user = current_user
    @advance = advance
  end

  def create
    notification_params = {
      'sender' => ProfileService.new(@current_user.username).profile,
      'message' => create_message,
      'detail_url' => "/viewRequestedAdvance/#{@advance.id}",
      'recipients' => finance_id
    }
    NotificationWorker.new.perform(notification_params)
  end

  def update
    notification_params = {
      'sender' => ProfileService.new(@current_user.username).profile,
      'message' => update_message,
      'detail_url' => "/viewRequestedAdvance/#{@advance.id}",
      'recipients' => update_recipients
    }
    NotificationWorker.new.perform(notification_params)
  end

  private

  def create_message
    advance_type = if @advance.claim_dsa
                     DSA_TYPE[@advance.advance_type]
                   else
                     ADVANCE_TYPE[@advance.advance_type]
                   end
    "New #{advance_type} application has been submitted."
  end

  def update_message
    advance_type = if @advance.claim_dsa
                     DSA_TYPE[@advance.advance_type]
                   else
                     ADVANCE_TYPE[@advance.advance_type]
                   end

    case @advance.status
    when 'verified'
      "#{advance_type} has been verified by the Finance."
    when 'comfirmed'
      "#{advance_type} has been approved by the DAF Director."
    when 'rejected'
      "#{advance_type} has been rejected by the Finance."
    when 'dispatched'
      "#{advance_type} has been issued by the Finance."
    when 'closed'
      "#{advance_type} has been closed by the Finance."
    end
  end

  def update_recipients
    recipients = [creator_id]

    case @advance.status
    when 'verified'
      recipients = [*recipients, *daf_id]
    when 'confirmed'
      recipients = [*recipients, *finance_id]
    end

    recipients.flatten
  end

  def finance_id
    User.where(role_id: Role.find_by(name: 'Finance').id).pluck :id
  end

  def daf_id
    User.where(role_id: Role.find_by(name: 'DAF Director').id).pluck :id
  end

  def creator_id
    @advance.user.id
  end
end
