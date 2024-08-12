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
        name: user_full_name(@advance.user.username),
        designation: position_title(icbs_user(@advance.user.username).designationid),
        department: @advance.user.department,
        verified_by: @advance.verifier.attributes.merge(
          name: user_full_name(@advance.verifier.username)
        ),
        confirmed_by: @advance.confirmer,
      },
      previous_advance: {
        salary_advance: nil,
        other_advance: 2000,
        tour_advance: 2000
      },
      detail: @advance.salary_advance,
      net_pay: Icbs::PayDetail.net_amount(icbs_user(@advance.user.username).employeeid)
      )
  end

  def other_report

  end

  def travel_advance_report

  end

  def travel_dsa_report

  end

  private

  def icbs_user(username)
    icbs_user = Icbs::EmployeeMst.find_by(employeecode: username)
  end

  def user_full_name(username)
    user = icbs_user(username)
    if user
      [user.firstname, user.middlename, user.lastname].compact.join(' ')
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
