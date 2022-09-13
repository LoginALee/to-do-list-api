# frozen_string_literal: true

module ApiHelpers
  def json
    JSON.parse(response.body)
  end

  def login_user(user)
    post '/login', params:
      {
        username: user.username,
        password: user.password
      }
  end
end
