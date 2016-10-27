class Deliver < ApplicationRecord
  validates :order_id, presence: true
end