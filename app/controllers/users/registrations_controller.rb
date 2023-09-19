# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  # def create
  #   super
  # end

  def create
    if verify_recaptcha
      super do |resource|
      flash[:success] = 'You have successfully registered, please check your email to confirm!'
      end
    else
      flash.delete(:recaptcha_error)
      build_resource(sign_up_params)  
      resource.valid?
      resource.errors.add(:reCaptcha, t('static_pages.signup.error_reCaptcha'))
      clean_up_passwords(resource)
      render :new
    end
  end

  # GET /resource/edit
  def edit
    @user = current_user
  end

  # PUT /resource
  def update
    @user = User.find(current_user.id)
    Rails.logger.info params  
    if params[:password].blank? && params[:user][:gender] != nil
      params[:user][:gender] = User.genders[params[:user][:gender]]
      if @user.update_without_password(account_update_params_without_password)
        render :edit
      else
        respond_with(resource, action: :edit)
      end
    else
      if @user.update(account_update_params_with_password)
        sign_out @user
      else
        respond_with(resource, action: :edit)
      end
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone, :last_name, :first_name, :gender, :address])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:phone, :last_name, :first_name, :gender, :address, :password, :password_confirmation])
  # end

  def account_update_params_without_password
    params.require(:user).permit(:phone, :last_name, :first_name, :gender, :address, :avatar, :images)
  end

  def account_update_params_with_password
    params.require(:user).permit(:password, :password_confirmation)
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
