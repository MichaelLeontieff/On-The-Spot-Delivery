class Checkingin < ApplicationRecord
  validates :order_id, presence: true, format: { without: /\ANone\z/, message: "must select an order" }
  validates :checked_in, presence: true, format: { with: /\AYes\z/ }
end
