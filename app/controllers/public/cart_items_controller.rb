class Public::CartItemsController < ApplicationController
  
  def index
  @cart_items = current_customer.cart_items
  end
  
  def  create
  @cart_item = CartItem.new(cart_item_params)
  @cart_item.customer_id = current_customer.id 
  @cart_item.save
  redirect_to public_cart_items_path
 
  end
  
  def update
  @cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to public_cart_items_path
   
  end
  
  def destroy
   @cart_item = CartItem.find(params[:id])
   @cart_item.destroy
    redirect_to public_cart_items_path
  end
  
  def destroy_all
   @cart_items = CartItem.all
   @cart_items.destroy_all
     redirect_to public_cart_items_path
  end
  
   private
  # ストロングパラメータ
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount, :price, :customer_id )
  end
  
end
