# frozen_string_literal: true

# User Address Proofs
class Api::V1::AddressProof < ApplicationRecord
  belongs_to :user
end
