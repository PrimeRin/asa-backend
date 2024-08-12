# frozen_string_literal: true

class ReportService
  def initialize(advance)
    @advance = advance
  end

  def create
    case @advance.advance_type
    when "salary_advance"
      salary_report
    when "other_advance"
      other_report
    when "tour_advance"
      travel_advance_report
    when "dsa_claim"
      travel_dsa_report
    else
      handle_unknown_advance_type
    end
  end

  def salary_report
    @advance.attributes.merge(
      user: {
        eid: @advance.user.username,
        name: user_full_name,
        designation: position_title(icbs_user.designationid),
        department: @advance.user.department,
        verified_by: @advance.verifier,
        confirmed_by: @advance.confirmer,
      },
      previous_advance: {
        salary_advance: nil,
        other_advance: 2000,
        tour_advance: 2000
      },
      detail: @advance.salary_advance,
      net_pay: Icbs::PayDetail.net_amount(icbs_user.employeeid)
      )
  end

  def other_report

  end

  def travel_advance_report

  end

  def travel_dsa_report

  end

  private

  def icbs_user
    @icbs_user ||= Icbs::EmployeeMst.find_by(employeecode: @advance.user.username)
  end

  def user_full_name
    if icbs_user
      [icbs_user.firstname, icbs_user.middlename, icbs_user.lastname].compact.join(' ')
    else
      "Unknown User"
    end
  end

  def position_title(designation_id)
    Icbs::Designation.find(designation_id)&.designationname || "Unknown Position"
  end

  def handle_unknown_advance_type
    Rails.logger.error("Unknown advance_type: #{@advance.advance_type}")
  end
end
