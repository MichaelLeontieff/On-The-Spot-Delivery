class Pickup < ApplicationRecord
  has_one :order, :dependent => :destroy

  validates :charge, presence: true, numericality: true
  validates :collected, presence: true
end
