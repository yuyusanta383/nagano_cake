class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @customer = current_customer
    @address = Address.all
  end
  
  def confirm
   @order = Order.new  
   @cart_items = CartItem.all  
   @order.payment_method = params[:order][:payment_method].to_i
  if params[:order][:address_option] == "0"  
    @order.postal_code = current_customer.postal_code  
    @order.address = current_customer.address
    @order.name = current_customer.name
  elsif params[:order][:address_option] == "1" 
   address = current_customer.addresses.find(params[:order][:address_id])
   @order.postal_code = address.postal_code  
   @order.address = address.address  
   @order.name = address.name
  elsif params[:order][:address_option] == "2"  
   @order.postal_code = params[:order][:postal_code]  
   @order.address = params[:order][:address]  
   @order.name = params[:order][:name]
      #上記で代入された住所をorderに代入
  
  end  
  
  @cart_items = CartItem.where(customer_id: current_customer.id)
  @sum = 0 

  end  
  
  def complete
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    @customer_cart_item = current_customer.cart_items
    @customer_cart_item.each do |cart_item|
    @order_datail = OrderHistoryDetail.new 
    @order_datail.amount = cart_item.amount
    @order_datail.price = cart_item.item.price
    @order_datail.item_id = cart_item.item_id
    @order_datail.order_id = @order.id
    @order_datail.save
    end
    @customer_cart_item.destroy_all
    
    redirect_to public_orders_complete_path
  end
  
   
  
  def index
    @order = current_customer.orders
    @order.each do |order| 
    order.order_history_details.each do |order_detail|
    i = order_detail.item_id
    @item = Item.find(i)
    end
    end
  end
  
  def show
  @order = Order.find(params[:id])
  @order_details = @order.order_history_details
  end

private 

 

 def order_params
  params.require(:order).permit(:payment, :name, :address, :postal_code, :shipping, :payment_method, :customer_id )
 end
end