namespace :users do
  desc 'Update the User with respect to ICBS'
  task update_detail: :environment do
    Icbs::EmployeeMst.find_each do |user|

      begin
        department_name = Icbs::Division.find(user.divisionid).divisionname
      rescue ActiveRecord::RecordNotFound
        department_name = nil
      end

      begin
        position_title = Icbs::Designation.find(user.designationid).designationname
      rescue ActiveRecord::RecordNotFound
        position_title = nil
      end

      existing_user = User.find_by(username: user.employeecode)

      if existing_user
        existing_user.update(
          email: user.emailaddress,
          password: user.intweb_pwd,
          role_id: Role.first.id,
          mobile_number: user.mob_no,
          first_name: user.firstname,
          middle_name: user.middlename,
          last_name: user.lastname,
          department_name: department_name,
          position_title: position_title,
          basic_pay: user.basicpay,
          )
        puts "User ID #{user.employeecode} has been updated"
      else
        User.create(
          email: user.emailaddress,
          password: user.intweb_pwd,
          username: user.employeecode,
          role_id: Role.first.id,
          mobile_number: user.mob_no,
          first_name: user.firstname,
          middle_name: user.middlename,
          last_name: user.lastname,
          department_name: department_name,
          position_title: position_title,
          basic_pay: user.basicpay,
          )
        puts "User ID #{user.employeecode} has been created"
      end
    end

    puts 'Finished updating all users'
  end
end
