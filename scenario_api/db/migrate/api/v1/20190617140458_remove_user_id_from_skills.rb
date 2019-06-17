# frozen_string_literal: true

# Remove user column from skills
class RemoveUserIdFromSkills < ActiveRecord::Migration[6.0]
  def change
    remove_column :skills, :user_id if column_exists?(:skills, :user_id)
  end
end
