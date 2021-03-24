class Admin::OrderHistoryDetailsController < ApplicationController
  def update
   @order_detail = OrderHistoryDetail.find(params[:id])
   @order = @order_detail.order
   @order_detail.update(order_history_detail_params)
   if @order_detail.making_status == "製作中" 
	 @order.update(status: 2) 
			
   elsif @order.order_history_details.count ==  @order.order_history_details.where(making_status: "製作完了").count
		@order.update(status: 3) 
   end
		redirect_to admin_order_path(@order) 
	
  end
 
   private
 
    def order_history_detail_params
     params.require(:order_history_detail).permit(:making_status)
    end
end  
  

