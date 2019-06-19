# frozen_string_literal: true

# User Address Proof Serializer
class Api::V1::AddressProofSerializer < ActiveModel::Serializer
  type :data

  attributes :id, :name, :proof_type, :proof_no, :issued_date, :expiry_date, :active
end
