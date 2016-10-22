class Order < ApplicationRecord
  has_one :customer, :dependent => :destroy

  # User id is injected afterwards, as the currently logged in user places the order and the id is sourced from that
  # not user input
  #validates :user_id, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
  VALID_TIME_REGEX = /\A([01]?[0-9]|2[0-3])\:[0-5][0-9]\z/
  validates :pickup_time, presence: true, format: {with: VALID_TIME_REGEX}
  validates :no_packages, presence: true, numericality: true
  validates :gross_weight, presence: true, numericality: true
  validates :receiver_name, presence: true, length: {minimum: 2}, format: { with: /\A[a-zA-Z ]+\z/, message: "your name must only contain letters" }
  validates :receiver_street, presence: true
  validates :receiver_suburb, presence: true, format: { with: /\A[a-zA-Z ]+\z/, message: "your suburb must contain letters only" }
  validates :receiver_city, presence: true, format: { with: /\A[a-zA-Z ]+\z/, message: "your city must contain letters only" }
  validates :receiver_postcode, presence: true, numericality: true, length: {minimum: 4, maximum: 4}
  validates :insurance, presence: true

end
