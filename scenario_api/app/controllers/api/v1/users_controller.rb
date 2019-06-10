# frozen_string_literal: true

# User Controller - basic user activities
class Api::V1::UsersController < Api::V1::ApiController
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

  private

  def user(user_info)
    Api::V1::UserSerializer.new(user_info).serialized_json
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :middle_name, :user_name, :password)
  end
end
