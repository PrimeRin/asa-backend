# frozen_string_literal: true

class ReportService
  ADVANCE_TYPE = {
    'salary_advance' => '1302004',
    'other_advance' => '1302008',
    'tour_advance' => '1302003',
  }.freeze
  def initialize(advance)
    @advance = advance
  end

  def create
    case @advance.advance_type
    when "salary_advance"
      salary_report
    when "other_advance"
      other_report
    when "in_country_tour_advance", "in_country_dsa_claim",
      "ex_country_tour_advance", "ex_country_dsa_claim"
      travel_advance_report
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
      },
      verified_by: verifier_detail,
      confirmed_by: confirmer_detail,
      previous_advance: {
        salary_advance: previous_balance(@advance.user.username, ADVANCE_TYPE['salary_advance']),
        other_advance: previous_balance(@advance.user.username, ADVANCE_TYPE['other_advance']),
        tour_advance: previous_balance(@advance.user.username, ADVANCE_TYPE['tour_advance'])
      },
      detail: @advance.salary_advance,
      net_pay: Icbs::PayDetail.net_amount(icbs_user(@advance.user.username).employeeid)
      )
  end

  def other_report
    @advance.attributes.merge(
      user: {
        eid: @advance.user.username,
        name: user_full_name(@advance.user.username),
        designation: position_title(icbs_user(@advance.user.username).designationid),
        department: @advance.user.department,
      },
      verified_by: verifier_detail,
      confirmed_by: confirmer_detail,
      previous_advance: {
        other_advance: previous_balance(@advance.user.username, ADVANCE_TYPE['other_advance']),
      },
      detail: @advance.salary_advance,
    )
  end

  def travel_advance_report
    @advance.attributes.merge(
      user: {
        eid: @advance.user.username,
        name: user_full_name(@advance.user.username),
        designation: position_title(icbs_user(@advance.user.username).designationid),
        department: @advance.user.department,
        grade: grade_name(@advance.user.username),
        travel_itineraries: travel_itineraries,
      },
      verified_by: verifier_detail,
      confirmed_by: confirmer_detail,
    )
  end

  def travel_dsa_report
    @advance.attributes.merge(
      user: {
        eid: @advance.user.username,
        name: user_full_name(@advance.user.username),
        designation: position_title(icbs_user(@advance.user.username).designationid),
        department: @advance.user.department,
        grade: grade_name(@advance.user.username),
        travel_itineraries: @advance.travel_itineraries,
      },
      verified_by: verifier_detail,
      confirmed_by: confirmer_detail,
      )
  end

  private

  def previous_balance(slcode, glcode)
    Icbs::BalanceFetcher.fetch_balance(slcode, glcode)
  end

  def verifier_detail
    if @advance.verifier
      @advance.verifier.attributes.merge(name: user_full_name(@advance.verifier.username))
    else
      nil
    end
  end

  def confirmer_detail
    if @advance.confirmer
      @advance.confirmer.attributes.merge(
        name: user_full_name(@advance.confirmer.username), 
        role_name: role_name(@advance.confirmer.username)
        )
    else
      nil
    end
  end

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

  def role_name(username)
    user = User.find_by(username: username)
    if user
      user.role.name
    else
      "Unknown Role"
    end
  end


  def grade_name(username)
    begin
      user = icbs_user(username)
      if user
        Icbs::GradeMst.find_by(gradeid: user.gradeid).gradename
      end
    rescue NoMethodError
      "Unknown grade"
    rescue StandardError => e
      Rails.logger.error("Error fetching grade name for username #{username}: #{e.message}")
      "Unknown grade"
    end
  end

  def position_title(designation_id)
    begin
      Icbs::Designation.find(designation_id).designationname
    rescue ActiveRecord::RecordNotFound
      "Unknown Position"
    rescue StandardError => e
      Rails.logger.error("Error fetching position title for designation_id #{designation_id}: #{e.message}")
      "Unknown Position"
    end
  end

  def handle_unknown_advance_type
    Rails.logger.error("Unknown advance_type: #{@advance.advance_type}")
  end

  def travel_itineraries
    if @advance.advance_type == 'in_country_dsa_claim' || @advance.advance_type == 'ex_country_dsa_claim'
      advance = Advance.find(@advance.parent_id)
      advance.travel_itineraries
    else
      @advance.travel_itineraries
    end
  end
end
