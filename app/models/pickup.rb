class Pickup < ApplicationRecord
  validates :order_id, presence: true, format: { without: /\A0\z/, message: "must select an order" }
  validates :charge, presence: true, numericality: true
  validates :signature, presence: true
end