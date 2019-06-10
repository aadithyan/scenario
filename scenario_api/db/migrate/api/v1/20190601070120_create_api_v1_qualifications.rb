# frozen_string_literal: true

# Creates qualifications table
class CreateApiV1Qualifications < ActiveRecord::Migration[6.0]
  def change
    create_table :qualifications do |t|
      t.string :name, null: false, limit: 255
      t.string :institute, null: false, limit: 255
      t.text :address
      t.text :city, limit: 100
      t.string :state, limit: 100
      t.string :zip_postal_code, limit: 15
      t.text :country
      t.integer :start_year
      t.integer :end_year
      t.text :specialization
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
