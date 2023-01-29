# frozen_string_literal: true

module Api
  class ApplicationController < ActionController::API
    before_action :authenticate_user!, raise: false

    def authenticate_user!(_options = {})
      render json: { message: 'No user found!' }, status: :unauthorized unless signed_in?
    end

    def current_user
      @current_user ||= super || User.find_by(email: params[:email])
    end

    def signed_in?
      params[:email].present? && current_user
    end
  end
end
