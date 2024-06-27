# frozen_string_literal: true

require 'swagger_helper'

describe 'Users API' do
  path '/api/users' do
    get 'Retrieves all users' do
      tags 'Users'
      produces 'application/json'
      parameter name: :page, in: :query, type: :integer, description: 'Page number'

      response '200', 'users found' do
        schema type: :object,
               properties: {
                 pagy: { type: :object },
                 users: { type: :array, items: { '$ref' => '#/definitions/User' } }
               }

        run_test!
      end
    end

    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string },
          profile_pic: { type: :string },
          grade_id: { type: :integer },
          role_id: { type: :integer }
        },
        required: %w[email password password_confirmation]
      }

      response '201', 'user created' do
        let(:user) { { email: 'user@example.com', password: 'password', password_confirmation: 'password' } }
        run_test!
      end

      response '422', 'unprocessable entity' do
        let(:user) { { email: 'user@example.com' } }
        run_test!
      end
    end
  end

  path '/api/users/{id}' do
    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer, description: 'ID of the user to retrieve'

      response '200', 'user found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 email: { type: :string },
                 profile_pic: { type: :string },
                 grade_id: { type: :integer },
                 role_id: { type: :integer },
                 created_at: { type: :string, format: :date_time },
                 updated_at: { type: :string, format: :date_time },
                 role: { type: :object },
                 grade: { type: :object }
               }

        let(:id) { User.create(email: 'user@example.com').id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :integer, description: 'ID of the user to update'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          profile_pic: { type: :string },
          grade_id: { type: :integer },
          role_id: { type: :integer }
        },
        required: %w[email]
      }

      response '200', 'user updated' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 email: { type: :string },
                 profile_pic: { type: :string },
                 grade_id: { type: :integer },
                 role_id: { type: :integer },
                 created_at: { type: :string, format: :date_time },
                 updated_at: { type: :string, format: :date_time },
                 role: { type: :object },
                 grade: { type: :object }
               }

        let(:id) { User.create(email: 'user@example.com').id }
        let(:user) { { email: 'updated@example.com' } }
        run_test!
      end

      response '422', 'unprocessable entity' do
        let(:id) { User.create(email: 'user@example.com').id }
        let(:user) { { email: '' } }
        run_test!
      end
    end

    delete 'Deletes a user' do
      tags 'Users'
      parameter name: :id, in: :path, type: :integer, description: 'ID of the user to delete'

      response '204', 'user deleted' do
        let(:id) { User.create(email: 'user@example.com').id }
        run_test!
      end
    end
  end
end

# Definitions for the User model
RSpec.configure do |config|
  config.swagger_docs = {
    'v1/swagger.json' => {
      swagger: '2.0',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      definitions: {
        User: {
          type: :object,
          properties: {
            id: { type: :integer },
            email: { type: :string },
            profile_pic: { type: :string },
            grade_id: { type: :integer },
            role_id: { type: :integer },
            created_at: { type: :string, format: :date_time },
            updated_at: { type: :string, format: :date_time },
            role: { type: :object },
            grade: { type: :object }
          },
          required: %w[id email created_at updated_at]
        }
      }
    }
  }
end
