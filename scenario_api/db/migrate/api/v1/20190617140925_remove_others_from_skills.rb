# frozen_string_literal: true

# Remove Other columns from skills table
class RemoveOthersFromSkills < ActiveRecord::Migration[6.0]
  def change
    remove_column :skills, :years if column_exists?(:skills, :years)
    remove_column :skills, :level_id if column_exists?(:skills, :level_id)
  end
end
