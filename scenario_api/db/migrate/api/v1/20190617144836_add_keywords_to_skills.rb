# frozen_string_literal: true

# Add keywords column to skills table
class AddKeywordsToSkills < ActiveRecord::Migration[6.0]
  def change
    add_column(:skills, :keywords, :text, null: false) unless column_exists?(:skills, :keywords)
  end
end
