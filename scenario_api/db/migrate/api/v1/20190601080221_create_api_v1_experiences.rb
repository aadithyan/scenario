# frozen_string_literal: true

# Create Experience table
class CreateApiV1Experiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :company, null: false, limit: 255
      t.string :job_title, null: false, limit: 255
      t.date :start_date
      t.date :end_date
      t.boolean :current, default: false
      t.text :comment
      t.string :website, limit: 255
      t.string :period
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
