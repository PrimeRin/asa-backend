# frozen_string_literal: true

# Rails console
user = User.first
user.profile_pic.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'profile.jpg')),
                        filename: 'profile.jpg', content_type: 'image/jpeg')

# Check profile pic
user = User.find_by(username: 'example_username')
if user.profile_pic.attached?
  puts "Filename: #{user.profile_pic.filename}"
  puts "Content Type: #{user.profile_pic.content_type}"
  puts "Byte Size: #{user.profile_pic.byte_size}"
  puts "URL: #{url_for(user.profile_pic)}"
else
  puts 'No profile picture attached.'
end

advance.files.attach(io: File.open(Rails.root.join('app', 'assets', 'files', 'DFERM (3).pdf')),
                     filename: 'DFERM (3).pdf', content_type: 'application/pdf')
advance.files.each do |file|
  puts "File Name: #{file.filename}"
  puts "File Size: #{file.blob.byte_size} bytes"
end

# check db connection
ActiveRecord::Base.connection_pool.with_connection(&:active?)

# docker build -t asa_backend .
#   docker run -d -p 3000:3000 asa_backend
# docker exec -it <container_id_or_name> sh
# docker ps

# docker tag my-local-image:latest yourusername/your-repo:latest
# docker push yourusername/your-repo:latest
# rails s -b 0.0.0.0 -p 3006 -d

# rails g  migration test name:string --database secondary
# rails db:migrate:secondary
# rails db:migrate:primary
# rails db:migrate:rollback:secondary
# rails db:drop:primary
# rails db:drop:secondary
# rails g migration AddNameFieldsToUsers first_name:string middle_name:string last_name:string --database primary
# rails g migration AddDepartmentToUsers department_name:string --database primary
# rails g migration AddGradeFieldToUsers position_title:string basic_pay:decimal --database primary
# rails g migration RemoveNameFromUsers name:string --database primary

# #Rails console
# reload!
# Icbs::User.find(71)
# Icbs::User.take
# finance = ['2023012', '2024002'] .. [2005022] - 2005022
# daf = ['2005023']
# rails g migration RemoveFieldsFromUsers email:string mobile_number:string basic_pay:decimal first_name:string middle_name:string last_name:string position_title:string department_name:string --database primary

# rails g migration RemoveEmailFromUsers email:string --database primary
# \
# # StopOverRate
# - value : number
# - country : string
# - grade_name : string
# - rate :
#   - currency: string
# StopOverRate.where(country: 'India').update_all(currency: 'INR')
# DsaRate.where(to: 'Bhutan').update_all(currency: 'Nu')
# DsaRate.where(to: 'India').update_all(currency: 'INR')
# DsaRateThirdCountry.update_all(currency: "USD")


# TODO:
# - add validation for salary advance
# - add office order number for other advance

# Frontend
# - double notifications

# Deploy react in Nginx
# sudo nano /etc/nginx/sites-available/asa-web
server {
        listen 3004;
        listen [::]:3004;
        server_name asa-web;

        root /var/www/asa-web;
        index index.html;

        location / {
                try_files $uri $uri/ /index.html;
        }

}

sudo ln -s /etc/nginx/sites-available/asa-web /etc/nginx/sites-enabled/
# sudo nginx -t
# sudo systemctl restart nginx.service 
# sudo systemctl status nginx.service


# ## Clock service 
# --> nohup bundle exec clockwork clock.rb &

## Performs the job right now
DsaReminderJob.perform_now


## Redis server
--> ps aux | grep redis


server {
    listen 80;
    listen [::]:80;
    server_name asa.rma.org;

    # Redirect all HTTP traffic to HTTPS
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    listen [::]:443 ssl;
    server_name asa.rma.org;

    # SSL certificate and key
    ssl_certificate /etc/ssl/certs/wildcard_rma_org_bt.crt;
    ssl_certificate_key /etc/ssl/private/wildcard_rma_org_bt.key;

    # SSL settings
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;
    ssl_ciphers HIGH:!aNULL:!MD5;

    # Security headers
    add_header X-Frame-Options "DENY";
    add_header X-Content-Type-Options "nosniff";
    add_header X-XSS-Protection "1; mode=block";
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;

    root /var/www/asa-web;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}


server {
    listen 3011;
    listen [::]:3011;
    server_name radiator-web;

    root /var/www/radiator-web;
    index index.html;

    # Serve static files (e.g., favicon.ico, images, styles, etc.)
    location /_next/ {
        alias /var/www/radiator-web/.next/;
    }

    # Serve static assets like favicon.ico, images, etc.
    location /static/ {
        alias /var/www/radiator-web/public/;
    }

    # Handling all other requests (i.e., routing via Next.js)
    location / {
        try_files $uri $uri/ @nextjs;
  }
    
}
