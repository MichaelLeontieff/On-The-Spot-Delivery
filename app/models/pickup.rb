class Pickup < ApplicationRecord
  has_one :order, :dependent => :destroy
end
