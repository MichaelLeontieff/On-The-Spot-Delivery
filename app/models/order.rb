class Order < ApplicationRecord



  validates :no_packages, presence: true
  validates :gross_weight, presence: true
  validates :pickup_time, presence: true
  validates :receiver_name, presence: true
  validates :receiver_street, presence: true
  validates :receiver_suburb, presence: true
  validates :receiver_city, presence: true
  validates :receiver_postcode, presence: true
  validates :insurance, presence: true

end
