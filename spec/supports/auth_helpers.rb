# frozen_string_literal: true

module AuthHelpers
  def sign_in(user)
    post '/users/sign_in', params: { user: { login: user.username, password: user.password } }
  end
end
