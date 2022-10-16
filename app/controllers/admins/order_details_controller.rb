class Admins::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_details_params)
    redirect_to admins_order_path
  end

  private

  def order_details_params
    params.require(:order_detail).permit(:order_id, :item_id, :amount, :price, :making_status_method)
  end

end
