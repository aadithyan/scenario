# frozen_string_literal: true

# Create Address Proofs
class CreateApiV1AddressProofs < ActiveRecord::Migration[6.0]
  def change
    create_table :address_proofs do |t|
      t.string :name, null: false, limit: 255
      t.string :proof_type, limit: 255
      t.string :proof_no
      t.date :issued_date
      t.date :expiry_date
      t.boolean :active, default: true
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
