class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 def after_sign_in_path_for(resource)
  case resource
  when Admin
    admin_orders_path(order_sort: 0)
  when Customer
    public_customers_show_path
  end
 end
  
  #strong parameter
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:fast_name_kana,:last_name_kana,:phone_number,:postal_code,:address])
  end
end
