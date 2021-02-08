class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #strong parameter
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:phone_number,:postal_code,:steet_address])
  end

end
