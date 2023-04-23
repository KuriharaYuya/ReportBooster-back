class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table "user".pluralize.to_sym, id: false do |t|
      t.string :id
      t.string :cognito_sub
      t.string :username
      t.string :email

      t.timestamps
    end
  end
end
