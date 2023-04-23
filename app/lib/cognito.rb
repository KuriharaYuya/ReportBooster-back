require 'aws-sdk-cognitoidentityprovider'

class Cognito
  def self.authenticate(_token)
    'hello'
  rescue StandardError => e
    # 例外処理
    raise "Failed to authenticate user: #{e.message}"
  end
end
