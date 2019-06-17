# frozen_string_literal: true

# Add index column to skills table
class AddIndexToNameInSkills < ActiveRecord::Migration[6.0]
  def change
    add_index(:skills, [:name], unique: true)
  end
end
