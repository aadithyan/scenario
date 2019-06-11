# frozen_string_literal: true

# Create Packages Table
class CreateApiV1Packages < ActiveRecord::Migration[6.0]
  def change
    create_table :package_categories do |t|
      t.string :name, null: false, limit: 255
      t.text :description
    end

    create_table :packages do |t|
      t.string :name, null: false, limit: 255
      t.string :package_code, null: false
      t.references :package_categories, index: true
      t.text :description
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
