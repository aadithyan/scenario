# frozen_string_literal: true

# Levels Controller
class Api::V1::LevelsController < Api::V1::ApiController
  before_action :authorize_request

  def index
    render json: levels, status: :ok
  end

  private

  def levels
    levels = Api::V1::LevelService.list_active_levels
    ActiveModelSerializers::SerializableResource
      .new(levels,
           each_serializer: Api::V1::LevelSerializer).as_json
  end
end
