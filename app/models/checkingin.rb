class Checkingin < ApplicationRecord
  validates :order_id, presence: true
end
