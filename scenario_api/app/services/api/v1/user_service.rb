# frozen_string_literal: true

# User Service
module Api
  module V1
    # User Service
    class UserService
      class << self
        def create_user(user_params)
          return_value = { status: ERROR_STATUS }
          return return_value if user_params.blank?

          user = Api::V1::User.new(user_params)
          user.authentication_token = Api::V1::User.generate_token(user.id)
          if user.save
            return_value[:status] = SUCCESS_STATUS
            return_value[:user] = user
          else
            return_value[:errors] = user.errors.full_messages.join('')
          end
          return_value
        end

        def login(user_params)
          return_value = { status: ERROR_STATUS }
          user = Api::V1::User.by_email(user_params[:email])
          if user&.authenticate(user_params[:password])
            user.authentication_token = Api::V1::User.generate_token(user.id)
            if user.save
              return_value[:status] = SUCCESS_STATUS
              return_value[:user] = user
            else
              return_value[:message] = I18n.t('api.v1.failed_messages.login_failed')
            end
          else
            return_value[:message] = I18n.t('api.v1.failed_messages.login_failed')
          end
          return_value
        end

        def change_password(user_params, user_id)
          return_value = { status: ERROR_STATUS }
          if user_id.blank? || user_params.blank?
            return_value[:message] = I18n.t('api.v1.failed_messages.parameter_missing')
            return return_value
          end
          user = Api::V1::User.by_user_id(user_id)
          if user.present?
            unless user.authenticate(user_params[:current_password])
              return_value[:message] = I18n.t('api.v1.failed_messages.current_password_incorrect')
              return return_value
            end
            if user_params[:new_password] != user_params[:password_confirmation]
              return_value[:message] = I18n.t('api.v1.failed_messages.new_password_mismatch')
              return return_value
            end
            if user.update(password: user_params[:new_password])
              return_value[:status] = SUCCESS_STATUS
              return_value[:message] = I18n.t('api.v1.success_messages.change_password')
            else
              return_value[:message] = I18n.t('api.v1.failed_messages.change_password')
            end
          else
            return_value[:message] = I18n.t('api.v1.failed_messages.not_found')
          end
          return_value
        end

        def update_user(user_params, user_id)
          return_value = { status: ERROR_STATUS }
          if user_id.blank? || user_params.blank?
            return_value[:message] = I18n.t('api.v1.failed_messages.parameter_missing')
            return return_value
          end

          user = Api::V1::User.by_user_id(user_id)
          if user.present?
            if user.update(user_params)
              return_value[:status] = SUCCESS_STATUS
              return_value[:user] = user
            end
          else
            return_value[:message] = I18n.t('api.v1.failed_messages.not_found')
          end
          return_value
        end

        def list_all_users
          Api::V1::User.by_active
        end

        def find_user(user_id)
          return_value = { status: ERROR_STATUS }
          if user_id.blank?
            return_value[:message] = I18n.t('api.v1.failed_messages.parameter_missing')
            return return_value
          end
          user = Api::V1::User.by_user_id(user_id)
          if user.present?
            return_value[:status] = SUCCESS_STATUS
            return_value[:user] = user
          else
            return_value[:message] = I18n.t('api.v1.failed_messages.not_found')
          end
          return_value
        end

        def create_user_skills(skills_params)
          return_value = { status: ERROR_STATUS }
          if skills_params.blank?
            return_value[:message] = I18n.t('api.v1.failed_messages.parameter_missing')
            return return_value
          end
          if skills_params.present? && skills_params[:user_id].blank?
            return_value[:message] = I18n.t('api.v1.failed_messages.parameter_missing')
            return return_value
          end
          user = Api::V1::User.by_user_id(skills_params[:user_id])
          errors = []
          if user.present?
            skills_params[:user_skill].each do |uskill|
              user_skill = Api::V1::UserSkill.new(uskill)
              user_skill.user_id = user.id
              errors.push(user_skill.errors.full_messages.join('')) unless user_skill.save
            end
            if errors.present? || errors.count.positive?
              return_value[:message] = errors.uniq.join(' , ')
            else
              return_value[:status] = SUCCESS_STATUS
              return_value[:user] = user
            end
          else
            return_value[:message] = I18n.t('api.v1.failed_messages.not_found')
          end
          return_value
        end

        def create_user_languages(language_params)
          return_value = { status: ERROR_STATUS }
          if language_params.blank?
            return_value[:message] = I18n.t('api.v1.failed_messages.parameter_missing')
            return return_value
          end
          if language_params.present? && language_params[:user_id].blank?
            return_value[:message] = I18n.t('api.v1.failed_messages.parameter_missing')
            return return_value
          end
          user = Api::V1::User.by_user_id(language_params[:user_id])
          errors = []
          if user.present?
            language_params[:languages].each do |user_language_param|
              user_language = Api::V1::Language.new(user_language_param)
              user_language.user_id = user.id
              user_language.fluency = Api::V1::Language::FLUENCY_VALUES[:"#{user_language_param[:fluency]}"]
              user_language.competancy = Api::V1::Language::COMPETENCY_VALUES[:"#{user_language_param[:competancy]}"]
              errors.push(user_language.errors.full_messages.join('')) unless user_language.save
            end
            if errors.present? || errors.count.positive?
              return_value[:message] = errors.uniq.join(' , ')
            else
              return_value[:status] = SUCCESS_STATUS
              return_value[:user] = user
            end
          else
            return_value[:message] = I18n.t('api.v1.failed_messages.not_found')
          end
          return_value
        end

        def create_user_qualifications(qualifications_params)
          return_value = { status: ERROR_STATUS }
          if qualifications_params.blank?
            return_value[:message] = I18n.t('api.v1.failed_messages.parameter_missing')
            return return_value
          end
          if qualifications_params.present? && qualifications_params[:user_id].blank?
            return_value[:message] = I18n.t('api.v1.failed_messages.parameter_missing')
            return return_value
          end
          user = Api::V1::User.by_user_id(qualifications_params[:user_id])
          errors = []
          if user.present?
            qualifications_params[:qualifications].each do |user_qualiication_param|
              user_qualification = Api::V1::Qualification.new(user_qualiication_param)
              user_qualification.user_id = user.id
              errors.push(user_qualification.errors.full_messages.join('')) unless user_qualification.save
            end
            if errors.present? || errors.count.positive?
              return_value[:message] = errors.uniq.join(' , ')
            else
              return_value[:status] = SUCCESS_STATUS
              return_value[:user] = user
            end
          else
            return_value[:message] = I18n.t('api.v1.failed_messages.not_found')
          end
          return_value
        end

        def create_user_experiences(experiences_params)
          return_value = { status: ERROR_STATUS }
          if experiences_params.blank?
            return_value[:message] = I18n.t('api.v1.failed_messages.parameter_missing')
            return return_value
          end
          if experiences_params.present? && experiences_params[:user_id].blank?
            return_value[:message] = I18n.t('api.v1.failed_messages.parameter_missing')
            return return_value
          end
          user = Api::V1::User.by_user_id(experiences_params[:user_id])
          errors = []
          if user.present?
            experiences_params[:experiences].each do |user_experience_param|
              user_experience = Api::V1::Experience.new(user_experience_param)
              user_experience.user_id = user.id
              errors.push(user_experience.errors.full_messages.join('')) unless user_experience.save
            end
            if errors.present? || errors.count.positive?
              return_value[:message] = errors.uniq.join(' , ')
            else
              return_value[:status] = SUCCESS_STATUS
              return_value[:user] = user
            end
          else
            return_value[:message] = I18n.t('api.v1.failed_messages.not_found')
          end
          return_value
        end

        def create_user_proofs(proofs_params)
          return_value = { status: ERROR_STATUS }
          if proofs_params.blank?
            return_value[:message] = I18n.t('api.v1.failed_messages.parameter_missing')
            return return_value
          end
          if proofs_params.present? && proofs_params[:user_id].blank?
            return_value[:message] = I18n.t('api.v1.failed_messages.parameter_missing')
            return return_value
          end
          user = Api::V1::User.by_user_id(proofs_params[:user_id])
          errors = []
          if user.present?
            proofs_params[:proofs].each do |user_proofs_param|
              user_proof = Api::V1::AddressProof.new(user_proofs_param)
              user_proof.user_id = user.id
              errors.push(user_proof.errors.full_messages.join('')) unless user_proof.save
            end
            if errors.present? || errors.count.positive?
              return_value[:message] = errors.uniq.join(' , ')
            else
              return_value[:status] = SUCCESS_STATUS
              return_value[:user] = user
            end
          else
            return_value[:message] = I18n.t('api.v1.failed_messages.not_found')
          end
          return_value
        end
      end
    end
  end
end
