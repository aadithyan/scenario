# frozen_string_literal: true

# Add Index to skills
class AddIndexToSkills < ActiveRecord::Migration[6.0]
  def change
    add_index(:skills, [:id, :name], unique: true)
  end
end
