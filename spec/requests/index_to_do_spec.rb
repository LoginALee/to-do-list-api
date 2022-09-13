# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'To do', type: :request do
  describe 'GET /todos' do
    context 'with a logged in user' do
      before do
        @my_user = FactoryBot.create(:user)
        @my_to_do = FactoryBot.build(:todo)

        login_user @my_user

        @token = json['token']

        post '/todos', params:
                            {
                              todo: {
                                title: @my_to_do.title,
                                done: @my_to_do.done
                              }
                            }, headers: {
                              Authorization: "Bearer #{@token}"
                            }

        get '/todos', params:
                            {
                            }, headers: {
                              Authorization: "Bearer #{@token}"
                            }
      end
      it 'returns the title' do
        expect(json[0]['title']).to eq(@my_to_do.title)
      end

      it 'returns the status' do
        expect(json[0]['done']).to eq(@my_to_do.done)
      end

      it 'returns a ok status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
