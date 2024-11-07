class Api::V1::TokensController < ApplicationController
  # POST /v1/tokens
  def create
    user = User.find_by(email: token_params[:email])&.authenticate(token_params[:password])
    return (head :unauthorized) unless user
    render json: {user:, token: JsonWebToken.encode(user_id: user.id)}
  end

  # POST /v1/authorization
  def authorization
    token = request.headers["Authorization"]
    render json: {user_id: JsonWebToken.decode(token)["user_id"]}
  rescue
    head :forbidden
  end

  private

  def token_params
    params.require(:user).permit(:email, :password)
  end
end
