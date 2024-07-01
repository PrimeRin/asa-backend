# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/advances', type: :request do
  path '/api/advances' do
    get 'Retrieves all advances' do
      tags 'Advances'
      produces 'application/json'

      parameter name: :advance, in: :query, schema: {
        type: :object,
        properties: {
          status: { type: :array, items: { type: :string } },
          advance_type: { type: :array, items: { type: :string } }
        },
        required: %w[status advance_type]
      }

      response '200', 'advances found' do
        schema type: :array, items: {
          type: :object,
          properties: {
            id: { type: :integer },
            advance_type: { type: :string },
            status: { type: :string },
            amount: { type: :number },
            verified_by: { type: :integer, nullable: true },
            confirmed_by: { type: :integer, nullable: true },
            dispatch_by: { type: :integer, nullable: true },
            user_id: { type: :integer },
            created_at: { type: :string, format: :date_time },
            updated_at: { type: :string, format: :date_time }
          },
          required: %w[id advance_type status amount user_id created_at updated_at]
        }
        let(:advance) { create_list(:advance, 2) }
        run_test!
      end

      response '404', 'advances not found' do
        let(:advance) { 'invalid' }
        run_test!
      end
    end

    post 'Creates an advance' do
      tags 'Advances'
      consumes 'application/json'
      parameter name: :advance, in: :body, schema: {
        type: :object,
        properties: {
          advance_type: { type: :string },
          status: { type: :string },
          amount: { type: :number }
        },
        required: %w[advance_type status amount]
      }

      response '201', 'advance created' do
        let(:advance) { { advance_type: 'Type1', status: 'pending', amount: 1000 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:advance) { { advance_type: 'Type1' } }
        run_test!
      end
    end
  end

  path '/api/advances/{id}' do
    get 'Retrieves an advance' do
      tags 'Advances'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'advance found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 advance_type: { type: :string },
                 status: { type: :string },
                 amount: { type: :number },
                 verified_by: { type: :integer, nullable: true },
                 confirmed_by: { type: :integer, nullable: true },
                 dispatch_by: { type: :integer, nullable: true },
                 user_id: { type: :integer },
                 created_at: { type: :string, format: :date_time },
                 updated_at: { type: :string, format: :date_time }
               },
               required: %w[id advance_type status amount user_id created_at updated_at]

        let(:id) { create(:advance).id }
        run_test!
      end

      response '404', 'advance not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/advances/status_counts' do
    get 'Retrieves count of advances by status' do
      tags 'Advances'
      produces 'application/json'

      response '200', 'status counts found' do
        schema type: :object, properties: {
          status_count: { type: :object, additionalProperties: { type: :integer } }
        }
        run_test!
      end

      response '404', 'status counts not found' do
        run_test!
      end
    end
  end

  path '/api/advances/type_counts' do
    get 'Retrieves count of advances by type' do
      tags 'Advances'
      produces 'application/json'

      response '200', 'type counts found' do
        schema type: :object, properties: {
          type_count: { type: :object, additionalProperties: { type: :integer } }
        }
        run_test!
      end

      response '404', 'type counts not found' do
        run_test!
      end
    end
  end

  path '/api/advances/monthly_counts' do
    get 'Retrieves count of advances by month' do
      tags 'Advances'
      produces 'application/json'

      response '200', 'monthly counts found' do
        schema type: :object, properties: {
          monthly_count: { type: :object, additionalProperties: { type: :integer } }
        }
        run_test!
      end

      response '404', 'monthly counts not found' do
        run_test!
      end
    end
  end
end
