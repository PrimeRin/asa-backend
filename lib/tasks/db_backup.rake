# lib/tasks/db_backup.rake

namespace :db do
  desc 'Backup the MySQL database'
  task backup: :environment do
    # Configure your database and backup details
    backup_dir = '/home/prime/Desktop/asa/backup'
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')

    # Fetch database credentials from environment variables
    database_name = ENV['DATABASE_NAME']
    username = ENV['DATABASE_USERNAME']
    password = ENV['DATABASE_PASSWORD']

    # Command to create the full backup
    backup_file = "#{backup_dir}/backup_#{timestamp}.sql"
    
    # Ensure the password is formatted correctly with no space after -p
    command = "mysqldump -u #{username} -p#{password} #{database_name} > #{backup_file}"

    # Create the backup directory if it doesn't exist
    FileUtils.mkdir_p(backup_dir)

    # Execute the backup command
    puts "Starting database backup: #{backup_file}"
    system(command)

    if $?.success?
      puts "Backup created successfully at #{backup_file}!"
    else
      puts "Backup failed!"
    end
  end
end

# mysql -u username -ppassword database_name < /backup_path/backup_file.sql
