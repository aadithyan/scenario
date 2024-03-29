# frozen_string_literal: true

# Create languages tables
class CreateApiV1Languages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.string :name, null: false, limit: 100
      t.integer :fluency, default: 1
      t.integer :competancy, default: 1
      t.text :comments
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
