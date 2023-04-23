class UserSerializer < ActiveModel::Serializer
  attributes :id, :cognito_sub, :username, :email
end
