# frozen_string_literal: true

# Create Users Table
class CreateApiV1Users < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, limit: 50
      t.string :middle_name, limit: 50
      t.string :last_name, null: false, limit: 50
      t.string :user_name, null: false, limit: 100
      t.string :email, null: false, limit: 100
      t.string :work_email, limit: 100
      t.string :gender, default: 'Male'
      t.boolean :active, default: true
      t.text :about_me
      t.date :dob
      t.text :address
      t.text :city, limit: 100
      t.string :state, limit: 100
      t.string :zip_postal_code, limit: 15
      t.text :country
      t.string :contact_no
      t.string :emergency_contact_no
      t.string :profile_image_file_name
      t.string :nationality
      t.string :marital_status
      t.timestamps
    end
  end
end
