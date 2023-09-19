# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    csrf_token = form_authenticity_token
      Rails.logger.info("CSRF token form login: #{csrf_token}")
    super
  end

  # POST /resource/sign_in
  def create
    csrf_token = form_authenticity_token
      Rails.logger.info("CSRF token sign in #{csrf_token}")
    super
  end

  # DELETE /resource/sign_out
  def destroy
    csrf_token = form_authenticity_token
      Rails.logger.info("CSRF token sign out: #{csrf_token}")
    super
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
