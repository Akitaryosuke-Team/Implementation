class Admins::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      @order.order_details.update_all(making_status_method: 1)
      redirect_to admins_order_path
    else
      redirect_to admins_order_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :address, :postal_code, :name, :postage, :price, :payment_method, :status_method, :created_at, :update_at)
  end
end
