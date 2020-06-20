class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_parents

  def set_parents
    @parents = Category.where(ancestry: nil).limit(13)
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])
  end


  before_action :basic_auth

  before_action :set_parents

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end
end
