class Admins::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :address, :postal_code, :name, :postage, :price, :payment, :status, :created_at, :update_at)
  end
end
