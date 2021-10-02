require 'rails_helper'

describe "User" do
  let(:user) { create_user }
  let(:headers) { api_v1_headers(user) }

  describe "View" do
    it 'returns no_content' do
      expect{ get "/api/v1/users" }.to raise_error
    end
  end

  describe "Sign up" do
    it 'password too short' do
      post "/api/v1/users", params: {user: {email: 'test@123.com', password: '1234'}}
      expect(response).not_to be_successful
      expect(json['errors'][0]['title']).to match('Invalid password')
    end

    it 'set up user' do
      email = 'test@123.com'
      post "/api/v1/users", params: {user: {email: email, password: 'p@ssword123'}}
      user = User.find_by_email(email)
      expect(user.email).to match(email)
      expect(json['data']['id']).to match(user.id.to_s)
    end
  end


  describe "Sign In" do
    it 'failed' do
      post "/api/v1/users/sign_in", params: {user: {email: user.email, password: 'wrong_password'}}
      expect(response).not_to be_successful
    end

    it 'with correct password' do
      post "/api/v1/users/sign_in", params: {user: {email: user.email, password: user.password}}
      expect(response).to be_successful
      puts response.body
    end
  end

  describe "Show" do
    it 'get own user' do
      get "/api/v1/users/#{user.slug}", headers: api_v1_headers(user)
      expect(response).to be_successful
    end

    it 'get other user' do
      other_user = create_user
      get "/api/v1/users/#{other_user.slug}", headers: api_v1_headers(user)
      expect(response).not_to be_successful
    end
  end
end

