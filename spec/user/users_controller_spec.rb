# rspec with commitee
require 'rails_helper'

describe UsersController, type: :controller do
  include Committee::Rails::Test::Methods
  user_info = { sub: 'test123', username: 'testuser', email: 'test@example.com' }
  before do
    # Cognito.newをスタブ化する
    allow(Cognito).to receive(:authenticate).and_return(user_info)
  end

  describe 'POST users' do
    headers = { 'Authorization' => 'Bearer <トークン>', 'Content-Type' => 'application/json' }
    it 'response body' do
      # usernameが一致することを確認
      post :create, params: { headers: }
      expect(response.parsed_body['username']).to eq user_info[:username]
    end
  end
end
