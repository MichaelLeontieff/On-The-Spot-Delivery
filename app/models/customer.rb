class Customer < ApplicationRecord
  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :card_no, presence: true
  validates :card_type, presence: true
  validates :card_expiry, presence: true
  validates :street, presence: true
  validates :suburb, presence: true
  validates :postcode, presence: true
  validates :city, presence: true
  validates :email, presence: true




end
