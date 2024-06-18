# frozen_string_literal: true

require 'rails_helper'
require 'rack/test'
require 'json_web_token'

RSpec.describe 'Users::Sessions API', type: :request do
  let!(:role) { create(:role, name: 'Employee') }
  let!(:grade) { create(:grade) }
  let!(:user) { create(:user, email: 'test@example.com', password: 'password', role: role, grade: grade) }

  describe 'POST /users/sign_in' do
    it 'returns a success response with valid credentials' do
      post '/users/sign_in', params: { user: { login: user.username, password: 'password' } }
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['message']).to eq('Signed in successfully.')
    end

    it 'returns an unauthorized response with invalid credentials' do
      post '/users/sign_in', params: { user: { login: user.username, password: 'wrong_password' } }
      expect(response.status).to eq(401)
      expect(response.body).to eq('Invalid Login or password.')
    end
  end

  describe 'DELETE /users/sign_out' do
    let(:headers) { { 'Authorization' => "Bearer #{JsonWebToken.encode(user_id: user.id)}" } }

    it 'returns a success response' do
      delete '/users/sign_out', headers: headers
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['message']).to eq('Signed out successfully.')
    end
  end
end
