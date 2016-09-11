class Order < ApplicationRecord

  # User id is injected afterwards, as the currently logged in user places the order and the id is sourced from that
  # not user input
  #validates :user_id, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
  VALID_TIME_REGEX =~ /^([01]?[0-9]|2[0-3])\:[0-5][0-9]$/
  validates :pickup_time, presence: true, format: {with: VALID_TIME_REGEX}
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
