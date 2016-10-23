class Deliver < ApplicationRecord
  validates :order_id, presence: true
  validates :package_delivered, presence: true

end