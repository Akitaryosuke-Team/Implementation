class Publics::CartItemsController < ApplicationController
  def index
    @cart_item = current_admin.prepare_cart_item
    @cart_items = Cart_item.all
    @items = Item.all
  end

  def create
    @cart_item = current_admin.prepare_cart_item
    @item = Item.find(params[:item_id])
    redirect_to publics_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
