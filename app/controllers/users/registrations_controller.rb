class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :cpf, :profile_image, :email, :password, :address, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:first_name, :last_name, :cpf, :profile_image, :email, :password, :address, :password_confirmation, :current_password)
    end
  end

end
