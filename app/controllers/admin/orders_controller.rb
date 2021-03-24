class Admin::OrdersController < ApplicationController
 def index
    case params[:order_sort]
    when "0"
      @orders = Order.all
    when "1"
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.orders
    end
    
  
 end
 
 
#管理者側の注文履歴詳細
 def show
  @order = Order.find(params[:id])
  @order_details = @order.order_history_details
 end
 
 def update
  @order = Order.find(params[:id])
  @order.update(order_params)
   redirect_to  admin_order_path(@order)
 end
 
 private
 
 def order_params
  params.require(:order).permit(:status)
 end
end