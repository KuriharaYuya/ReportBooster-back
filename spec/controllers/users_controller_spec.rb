# rspec with commitee
require 'rails_helper'

describe UsersController, type: :request do
  include Committee::Rails::Test::Methods
  user_info = { sub: 'test123', username: 'testuser', email: 'test@example.com' }
  before do
    # Cognito.newをスタブ化する
    allow(Cognito).to receive(:authenticate).and_return(user_info)
  end

  headers = { Authorization: 'Bearer <トークン>' }

  describe 'POST users' do
    describe 'POST users' do
      it 'confirm json schema' do
        # headerのAuthorizationにトークンを入れてリクエストを送る
        post('/users', params: { headers: })
        assert_response_schema_confirm
        expect(response).to have_http_status(:ok)
      end

      it 'response body' do
        # usernameが一致することを確認
        post('/users', params: { headers: })
        expect(response.parsed_body['username']).to eq user_info[:username]
      end

      it 'user created' do
        # userの数が1増えていることを確認
        expect { post('/users', params: { headers: }) }.to change(User, :count).by(1)
      end
    end
  end
end
