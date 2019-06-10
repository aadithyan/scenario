# frozen_string_literal: true

# User Qualifications
class Api::V1::Qualification < ApplicationRecord
  belongs_to :user
end
