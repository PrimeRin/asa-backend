FROM ruby:2.7.8
RUN apt-get update
WORKDIR /myapp
COPY . /myapp
RUN bundle install
COPY config/database.yml config/puma.rb./config/
RUN rake db:create db:migrate db:seed
EXPOSE 3010
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
