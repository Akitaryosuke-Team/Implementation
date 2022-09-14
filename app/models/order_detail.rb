class OrderDetail < ApplicationRecord

  belongs_to :orders

  enum making_status_method: { no_production: 0, waiting_production: 1, production: 2, complete: 3 }
end
