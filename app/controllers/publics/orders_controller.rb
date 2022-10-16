class Publics::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_items.each do |cart|
        order_details = OrderDetail.new
        order_details.item_id = cart.item_id
        order_details.order_id = @order.id
        order_details.amount = cart.amount
        order_details.price = cart.item.price
        order_details.making_status_method = 0
        order_details.save
      end
      redirect_to complete_publics_orders_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    if params[:order_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order_address] == "1"
      @order.postal_code = Address.find(params[:address_id]).postal_code
      @order.address = Address.find(params[:address_id]).address
      @order.name = Address.find(params[:address_id]).name
    else
      params[:order_address] == "2"
      @order.postal_code
      @order.address
      @order.name
    end
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :address, :postal_code, :name, :postage, :price, :payment_method, :status_method)
  end

  def address_params
    params.require(:order).permit(:name, :address, :postal_code)
  end

end
