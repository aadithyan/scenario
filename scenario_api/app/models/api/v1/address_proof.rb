# frozen_string_literal: true

# User Address Proofs
class Api::V1::AddressProof < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :proof_type, presence: true
  validates :proof_no, presence: true
  validates :issued_date, presence: true
  validates :expiry_date, presence: true
end
