class Publics::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id, :image)
  end

end
