class Order < ApplicationRecord

  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status_method: { waiting_payment: 0, payment_confirmation: 1, production: 2, preparing: 3, sent: 4 }
end
