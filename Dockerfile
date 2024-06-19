FROM ruby:2.7.8
WORKDIR /app
COPY . /app
RUN bundle install
EXPOSE 3000
ENV SECRET_KEY_BASE mysecretkeybase
CMD ["rails", "server", "-b", "0.0.0.0"]
