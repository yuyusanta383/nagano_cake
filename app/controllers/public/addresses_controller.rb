class Public::AddressesController < ApplicationController
  
  def index
      @customer = current_customer
      @shipping_address = Address.new
      #@all_address = Address.all
  end
  
  def edit
   @shipping_address = Address.find(params[:id])
  end
  
  def create
   @shipping_address = Address.new(address_params)
   @shipping_address.customer_id = current_customer.id
   @shipping_address.save
   redirect_to public_addresses_path(@shipping_address)
  end

  def update
    @shipping_address = Address.find(params[:id])
    @shipping_address.update(address_params)
    redirect_to public_addresses_path
  end
  
  def destroy
    @shipping_address = Address.find(params[:id])
    @shipping_address.destroy
     redirect_to public_addresses_path
  end
  
  private
  # ストロングパラメータ
  def address_params
    params.require(:address).permit(:postal_code,:name,:address)
  
  end
end
