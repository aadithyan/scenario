# frozen_string_literal: true

# Skill Service
module Api
  module V1
    # Skill Service
    class SkillService
      class << self
        def list_all_skills
          Api::V1::Skill.list_all
        end

        def create_skills(skills_params)
          return_value = { status: ERROR_STATUS }
          if skills_params.blank?
            return_value[:message] = I18n.t('api.v1.failed_messages.parameter_missing')
            return return_value
          end
          skills_params[:skill].map do |skill|
            skill[:created_at] = Time.zone.now
            skill[:updated_at] = Time.zone.now
          end
          if Api::V1::Skill.insert_all(skills_params[:skill], unique_by: :name)
            return_value[:status] = SUCCESS_STATUS
            return_value[:message] = 'Successfully created skills'
          else
            return_value[:errors] = 'Failed to insert skills'
          end
          return_value
        end
      end
    end
  end
end
