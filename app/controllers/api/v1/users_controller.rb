class Api::V1::UsersController < ApplicationController
  # POST /v1/users
  def create
    @user = User.new(user_params)
    return (head :created) if @user.save
    render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
