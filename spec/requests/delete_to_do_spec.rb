# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'To do', type: :request do
  describe 'DELETE /todos/:id' do
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

        @id = json['id']

        delete "/todos/#{@id}", params:
                            {
                            }, headers: {
                              Authorization: "Bearer #{@token}"
                            }
      end

      it 'returns a no_content status' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
