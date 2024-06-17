

require 'swagger_helper'

RSpec.describe 'api/rates', type: :request do
  path '/api/rates' do
    get 'Retrieves a specific rate' do
      tags 'Rates'
      produces 'application/json'
      parameter name: :rate, in: :query, schema: {
        type: :object,
        properties: {
          from: { type: :string },
          to: { type: :string }
        },
        required: %w[from to]
      }

      response '200', 'rate found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 from: { type: :string },
                 to: { type: :string },
                 grade_id: { type: :integer },
                 created_at: { type: :string, format: :date_time },
                 updated_at: { type: :string, format: :date_time }
               },
               required: %w[id from to grade_id created_at updated_at]
        let(:rate) { create(:rate) }
        run_test!
      end

      response '404', 'rate not found' do
        let(:rate) { 'invalid' }
        run_test!
      end
    end

    post 'Creates a rate' do
      tags 'Rates'
      consumes 'application/json'
      parameter name: :rate, in: :body, schema: {
        type: :object,
        properties: {
          from: { type: :string },
          to: { type: :string },
          grade_id: { type: :string }
        },
        required: %w[from to grade_id]
      }

      response '201', 'rate created' do
        let(:rate) { { from: 'Country1', to: 'Country2', grade_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:rate) { { from: 'Country1' } }
        run_test!
      end
    end
  end

  path '/api/rates/countries' do
    get 'Retrieves all countries with rates' do
      tags 'Rates'
      produces 'application/json'

      response '200', 'countries found' do
        schema type: :array, items: {
          type: :string
        }
        let(:countries) { DsaRate.distinct.pluck(:from) }
        run_test!
      end
    end
  end
end