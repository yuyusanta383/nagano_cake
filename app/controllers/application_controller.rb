class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #strong parameter
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

end
