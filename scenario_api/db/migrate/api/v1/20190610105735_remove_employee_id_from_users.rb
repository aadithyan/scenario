# frozen_string_literal: true

# Add password_digest column to user
class RemoveEmployeeIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :employee_id if column_exists?(:users, :employee_id)
  end
end
