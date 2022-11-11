# frozen_string_literal: true

# application controller
class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

  private

  def authenticate_user
    token, _options = token_and_options(request)
    user_id = AuthenticationTokenService.decode(token)
    User.find(user_id)
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render status: :unauthorized
  end

  def not_destroyed(err)
    render json: { errors: err.record.errors }, status: :unprocessable_entity
  end
end
