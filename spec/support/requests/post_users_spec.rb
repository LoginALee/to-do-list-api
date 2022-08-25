require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_user) { FactoryBot.create(:user) }

      before do
        post '/api/v1/posts', params:
                          { 
                            username: my_user.username,
                            password: my_user.password,
                            email: my_user.email
                          } 
      end

      it 'returns the username' do
        expect(json['username']).to eq(my_user.username)
      end

      it 'returns the token' do
        expect(json['token']).to exist 
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/api/v1/posts', params:
                          { 
                            username: '',
                            password: '',
                            email: ''
                          } 
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end