class Pickup < ApplicationRecord
  validates :order_id, presence: true, format: { without: /\ANone\z/, message: "must select an order" }
  validates :charge, presence: true, numericality: true
  validates :collected, presence: true
  validates :signature, presence: true
end