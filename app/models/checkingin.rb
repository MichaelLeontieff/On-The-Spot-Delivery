class Checkingin < ApplicationRecord
  validates :order_id, presence: true
  validates :checked_in, presence: true, format: { with: /\AYes\z/ }
end
