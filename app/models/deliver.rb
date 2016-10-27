class Deliver < ApplicationRecord
  validates :order_id, presence: true, format: { without: /\ANone\z/, message: "must select an order" }
end