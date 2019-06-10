# frozen_string_literal: true

# User Experiences
class Api::V1::Experience < ApplicationRecord
  belongs_to :user
end
