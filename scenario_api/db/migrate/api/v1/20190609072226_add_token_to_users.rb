# frozen_string_literal: true

# Add authentication_token to user
class AddTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column(:users, :authentication_token, :text, null: false) unless column_exists?(:users, :authentication_token)
  end
end
