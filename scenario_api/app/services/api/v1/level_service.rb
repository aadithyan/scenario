# frozen_string_literal: true

# Level Service
module Api
  module V1
    # Skill Service
    class LevelService
      class << self
        def list_active_levels
          Api::V1::Level.active_levels
        end
      end
    end
  end
end
