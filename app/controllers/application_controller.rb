# Top level controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def resource_not_found; end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name,:last_name,:username,:email,:tel ,:password, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys:[:first_name,:last_name,:username,:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys:[:first_name,:last_name,:username,:tel ,:email, :password, :remember_me])
  end
end
# def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, address_attributes: [:country, :state, :city, :area, :postal_code]])
#   end
