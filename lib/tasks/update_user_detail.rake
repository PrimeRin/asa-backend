namespace :users do
  desc 'Update the User with respect to ICBS'
  task update_detail: :environment do
    Icbs::EmployeeMst.find_each do |user|
      existing_user = User.find_by(username: user.employeecode)
      if existing_user
        existing_user.update(
          password: user.intweb_pwd,
          role_id: Role.first.id,
          )
        puts "User ID #{user.employeecode} has been updated"
      else
        User.create(
          password: user.intweb_pwd,
          username: user.employeecode,
          role_id: Role.first.id,
          )
        puts "User ID #{user.employeecode} has been created"
      end
    end

    puts 'Finished updating all users'
  end
end
