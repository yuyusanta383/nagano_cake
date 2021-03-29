class Customers::SessionsController < Devise::SessionsController

    before_action :reject_cusutomer, only: [:create]
  
    protected
    
   def reject_cusutomer
    
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
  
    if @customer
      if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_customer_session_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
   end
end
