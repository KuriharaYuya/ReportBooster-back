class UsersController < ApplicationController
  def create
    token = request.headers['Authorization']
    sub, username, email = Cognito.authenticate(token).values_at(:sub, :username, :email)
    # 既に登録されているか確認
    if User.find_by(cognito_sub: sub)
      render json: { error: 'User already exists' }, status: :bad_request
    else
      user = User.create(cognito_sub: sub, username:, email:)
      if user.save
        serializer = UserSerializer.new(user)
        render json: serializer.serializable_hash.dig(:data, :attributes).to_json, status: :created
      end
    end
  end
end
