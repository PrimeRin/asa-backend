# frozen_string_literal: true

class ProfileService
  include UrlHelper
  def initialize(employee_id)
    @id = employee_id
  end

  def profile_image
    employee_image = Icbs::EmployeeImage.find_by(employeeid: @id)
    return nil unless employee_image&.photograph

    blob = ActiveStorage::Blob.create_and_upload!(
      io: StringIO.new(employee_image.photograph),
      filename: "#{employee_image.employeeid}_photograph.jpg",
      content_type: 'image/jpeg'
    )

    serialize_blob(blob, "#{employee_image.employeeid}_photograph.jpg")
  end

  def profile
    user_detail = Icbs::EmployeeMst.find_by(employeecode: @id)
    if user_detail
      @id = user_detail.employeeid
      profile_image
    end
  end
end