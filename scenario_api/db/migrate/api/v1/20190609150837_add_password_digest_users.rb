# frozen_string_literal: true

# Add password_digest column to user
class AddPasswordDigestUsers < ActiveRecord::Migration[6.0]
  def change
    add_column(:users, :password_digest, :text, null: false) unless column_exists?(:users, :password_digest)
  end
end
