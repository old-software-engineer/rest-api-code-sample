# This Controller is for UserAuthentication

# frozen_string_literal: true

module Api
  module V1
    # This is Controller for Authentication of User
    class AuthenticationController < ApplicationController
      class AuthenticationError < StandardError; end
      rescue_from ActionController::ParameterMissing, with: :parameter_missing
      rescue_from AuthenticationError, with: :handle_unauthenticated

      # POST /api/v1/authentication
      def create
        raise AuthenticationError unless user.authenticate(params.require(:password))

        token = AuthenticationTokenService.encode(user.id)

        render json: { token: token }, status: :created
      end

      private

      def user
        @user ||= User.find_by(username: params.require(:username))
      end

      def handle_unauthenticated
        head :unauthorized
      end

      def parameter_missing(err)
        render json: { error: err.message }, status: :unprocessable_entity
      end
    end
  end
end
