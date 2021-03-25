class Customers::SessionsController < Devise::SessionsController

    before_action :reject_user, only: [:create]
  
    protected
    def active_for_authentication?(customer)
     customer.super && (customer.is_deleted == false)
    end
    def reject_user
      @customer = Customer.find_by(email: params[:customer][:email].downcase)
      if @customer && @customer.valid_password?(params[:customer][:password] )&& !active_for_authentication?(@customer) 
          flash[:error] = "You are already unsubscribed"
          redirect_to new_customer_registration_path
      else
        flash[:error] = "Failed to log in"
      end
    end
end
