# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API::Advance ', type: :request do
  let!(:role) { create(:role, name: 'Employee') }
  let!(:grade) { create(:grade) }
  let!(:user) { create(:user, password: 'password', role: role, grade: grade) }
  let!(:advances) { create(:advance, user: user) }
  let!(:advance_params) do
    {
      advance: {
        advance_type: ['salary_advance'],
        status: ['pending']
      },
      page: 1
    }
  end

  describe 'GET /api/advances' do
    before { sign_in(user) }

    it 'returns a success response' do
      get '/api/advances', params: advance_params
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['advances'].count).to eq(1)
    end
  end

  describe 'GET /api/advances' do
    it 'returns a success response' do
      get '/api/advances', params: advance_params
      expect(response.status).to eq(401)
      expect(response.body).to eq('You need to sign in or sign up before continuing.')
    end
  end
end
