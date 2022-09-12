require 'rails_helper'

RSpec.describe 'Login', type: :request do
  describe 'POST /login' do
    context 'with valid parameters' do
      let!(:my_user) { FactoryBot.create(:user) }

      before do
        post '/login', params:
                          { 
                            username: my_user.username,
                            password: my_user.password,
                          } 
      end

      it 'returns the user' do
        expect(json['user']).to be_truthy
        expect(json['user']['username']).to eq(my_user.username)
        expect(json['user']['email']).to eq(my_user.email)
        expect(json['user']['id']).to eq(my_user.id)
      end

      it 'returns the token' do
        expect(json['token']).to be_truthy
      end

      it 'returns a ok status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/login', params:
                          { 
                            username: '',
                            password: '',
                          } 
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end