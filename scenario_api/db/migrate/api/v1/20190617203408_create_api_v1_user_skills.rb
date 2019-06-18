# frozen_string_literal: true

# Create User skills table
class CreateApiV1UserSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :user_skills do |t|
      t.references :user, null: false, index: true
      t.references :skill, null: false, index: true
      t.integer :years, default: 0
      t.integer :months, default: 0
      t.references :level, null: false, index: true
      t.timestamps
    end
  end
end
