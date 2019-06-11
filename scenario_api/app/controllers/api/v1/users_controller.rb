# frozen_string_literal: true

# User Controller - basic user activities
class Api::V1::UsersController < Api::V1::ApiController
  before_action :authorize_request, except: [:create, :login]

  def create
    return_value = Api::V1::UserService.create_user(user_params)
    if return_value[:status] == SUCCESS_STATUS
      render json: user(return_value[:user]), status: :created
    else
      render json: return_value, status: :conflict
    end
  end

  def login
    return_value = Api::V1::UserService.login(user_params)
    if return_value[:status] == SUCCESS_STATUS
      render json: user(return_value[:user]), status: :ok
    else
      render json: return_value, status: :conflict
    end
  end

  def update
    return_value = Api::V1::UserService.update_user(user_params, params[:id])
    if return_value[:status] == SUCCESS_STATUS
      render json: user(return_value[:user]), status: :ok
    else
      render json: return_value, status: :conflict
    end
  end

  def change_password
    return_value = Api::V1::UserService.change_password(user_params, params[:id])
    if return_value[:status] == SUCCESS_STATUS
      render json: return_value, status: :ok
    else
      render json: return_value, status: :conflict
    end
  end

  private

  def user(user_info)
    Api::V1::UserSerializer.new(user_info).serialized_json
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :middle_name, :user_name, :password,
                                 :work_email, :gender, :about_me, :dob, :address,
                                 :city, :state, :zip_postal_code, :country, :contact_no,
                                 :emergency_contact_no, :nationality, :marital_status,
                                 :current_password, :new_password, :password_confirmation)
  end
end
