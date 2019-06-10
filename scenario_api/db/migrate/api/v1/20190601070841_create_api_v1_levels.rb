# frozen_string_literal: true

# Create Levels table
class CreateApiV1Levels < ActiveRecord::Migration[6.0]
  def change
    create_table :levels do |t|
      t.string :name
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
