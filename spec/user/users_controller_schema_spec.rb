# rspec with commitee
require 'rails_helper'

RSpec.describe UsersController, type: :request do
  include Committee::Rails::Test::Methods

  user_info = { sub: '6c1ba7e241ea4763a13f20ea3fb90aa1', username: 'testuser', email: 'test@example.com' }
  before do
    # Cognito.newをスタブ化する
    allow(Cognito).to receive(:authenticate).and_return(user_info)
  end

  headers = { 'Authorization' => 'Bearer <トークン>', 'Content-Type' => 'application/json' }
  describe 'POST users' do
    it 'confirm json schema' do
      post('/users', headers:)
      assert_schema_conform
    end
  end
end
