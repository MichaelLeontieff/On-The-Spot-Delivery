class Customer < ApplicationRecord
  has_many :orders

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
  validates :first_name, presence: true, length: {minimum: 2}, format: { with: /\A[a-zA-Z]+\z/, message: "your first name must only contain letters" }
  validates :last_name, presence: true, length: {minimum: 2}, format: { with: /\A[a-zA-Z]+\z/, message: "your last name must only contain letters" }
  validates :card_no, presence: true, numericality: true, length: {minimum: 15, maximum: 16} # Amex has 15 digits and Mastercard and Visa have 16 digits
  validates :card_type, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "your card type must only contain letters" }
  validates :ccv, presence: true, numericality: true, length: {minimum: 3, maximum: 3}
  validates :card_expiry, presence: true
  validates :street, presence: true
  validates :suburb, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "your suburb must only contain letters" }
  validates :postcode, presence: true, length: {minimum: 4, maximum: 4}
  validates :city, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "your city must only contain letters" }
  validates :email, presence: true, length: {maximum: 100}, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true, length: {minimum: 8}

  has_secure_password
end
