# frozen_string_literal: true

require 'swagger_helper'

describe 'Authentication API' do
  path 'users/sign_in' do
    post 'Sign in user' do
      tags 'Authentication'
      consumes 'application/json'
      parameter name: :credentials, in: :body, schema: {
        type: :object,
        properties: {
          login: { type: :string },
          password: { type: :string }
        },
        required: %w[login password]
      }

      response '200', 'user signed in' do
        let(:credentials) { { email: 'user@example.com', password: 'password' } }
        run_test!
      end

      response '401', 'unauthorized user' do
        let(:credentials) { { email: 'user@example.com', password: 'wrong_password' } }
        run_test!
      end
    end
  end

  path 'users/sign_out' do
    delete 'Sign out user' do
      tags 'Authentication'

      response '200', 'user signed out' do
        run_test!
      end
    end
  end
end
