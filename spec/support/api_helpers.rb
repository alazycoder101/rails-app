module ApiHelpers

  require 'devise/jwt/test_helpers'

  def json
    JSON.parse(response.body)
  end

  def login_with_api(user)
    post '/api/v1/users/sign_in', params: {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  def api_v1_headers(user)
    headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json'  }
    # This will add a valid token for `user` in the `Authorization` header
    auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
    auth_headers
  end

  def set_devise_mapping
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

end
