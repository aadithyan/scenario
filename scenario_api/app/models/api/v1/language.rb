# frozen_string_literal: true

# User Languages
class Api::V1::Language < ApplicationRecord
  belongs_to :user
end
