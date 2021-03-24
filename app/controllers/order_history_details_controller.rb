class OrderHistoryDetailsController < ApplicationController

  def update
   @order_detail = OrderHistoryDetail.find(params[:id])
   @order = @order_detail.order
   @order_detail.update(order_history_details_params)
   if @order_detail.making_status == "製作中" #製作ステータスが「製作作中」なら入る
	 @order.update(status: 2) 
			
   elsif @order_detail.count ==  @order_detail.where(making_status: "製作完了").count
		@order.update(status: 3) #注文ステータスを「発送準備中]に更新
   end
		redirect_to admin_order_path(@order) 
	
  end
 
   private
 
    def order_history_details_params
     params.require(:order_history_details).permit(:making_status)
    end
 
end
 
