class Deliver < ApplicationRecord
  validates :order_id, presence: true, format: { without: /\ANone\z/, message: "must select an order" }
  validates :package_delivered, presence: true, format: { with: /\AYes\z/ }

end