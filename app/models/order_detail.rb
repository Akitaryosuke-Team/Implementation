class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum making_status_method: { no_production: 0, waiting_production: 1, production: 2, complete: 3 }

  def add_tax_price
    (self.price * 1.10).round
  end

end
