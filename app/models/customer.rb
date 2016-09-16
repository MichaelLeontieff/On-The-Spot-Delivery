class Customer < ApplicationRecord
  # has_many :orders
  # validates :username, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :card_no, presence: true
  # validates :card_type, presence: true
  # validates :card_expiry, presence: true
  # validates :street, presence: true
  # validates :suburb, presence: true
  # validates :postcode, presence: true
  # validates :city, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :password, presence: true
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
  validates :first_name, presence: true, length: {minimum: 2}
  validates :last_name, presence: true, length: {minimum: 2}
  validates :card_no, presence: true, numericality: true, length: {minimum: 15, maximum: 16} # Amex has 15 digits and Mastercard and Visa have 16 digits
  validates :card_type, presence: true
  #validates :ccv, presence, true, numericality: true, length: {minimum: 3, maximum: 3}
  validates :card_expiry, presence: true
  validates :street, presence: true
  validates :suburb, presence: true
  validates :postcode, presence: true, numericality: true, length: {minimum: 4, maximum: 4}
  validates :city, presence: true
  validates :email, presence: true, length: {maximum: 100}, uniqueness: {case_sensitive: false }, format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true

  has_secure_password
end
