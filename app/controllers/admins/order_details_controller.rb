class Admins::OrderDetailsController < ApplicationController

  private

  def order_details_params
    params.require(:order_details).permit(:order_id, :item_id, :amount, :price, :making_status)
  end

end
