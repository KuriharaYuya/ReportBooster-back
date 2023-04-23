# railsとmysqlの組み合わせでuuidを使うときは、DBの設定でuuidが使えないため、自分でモジュールを作成する必要がある
module ApplyNaturalPrimaryKey
  extend ActiveSupport::Concern
  included do
    before_create :generate_token

    private

    def generate_token
      self.id = loop do
        random_token = SecureRandom.uuid
        break random_token unless self.class.exists?(id: random_token)
      end
    end
  end
end
