class UsersController < ApplicationController
  def create
    token = params[:headers][:Authorization]
    sub, username, email = Cognito.authenticate(token).values_at(:sub, :username, :email)
    # 既に登録されているか確認
    if User.find_by(cognito_sub: sub)
      render json: { error: 'User already exists' }, status: :bad_request
    else
      user = User.create(cognito_sub: sub, username:, email:)
      render json: user, serializer: UserSerializer if user.save
    end
  end
end
