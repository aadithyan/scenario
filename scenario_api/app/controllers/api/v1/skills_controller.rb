# frozen_string_literal: true

# Skills Controller
class Api::V1::SkillsController < Api::V1::ApiController
  before_action :authorize_request

  def index
    render json: skills, status: :ok
  end

  def create
    return_value = Api::V1::SkillService.create_skills(skill_params)
    render json: return_value, status: :ok
  end

  private

  def skills
    skills_list = Api::V1::SkillService.list_all_skills
    ActiveModelSerializers::SerializableResource
      .new(skills_list,
           each_serializer: Api::V1::SkillSerializer).as_json
  end

  def skill_params
    params.permit(:id, skill: [:name, :keywords])
  end
end
