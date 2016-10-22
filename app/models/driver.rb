class Driver < ApplicationRecord

  VALID_NUMBER_PLATE_REGEX =  /[0-9]{1,3}[A-Z]{1,3}/
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :company_email, presence: true, length: {maximum: 100}, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :first_name, presence: true, length: {minimum: 2}
  validates :last_name, presence: true, length: {minimum: 2}
  validates :assigned_truck_rego, presence: true, length:{minimum: 6, maximum: 6}, uniqueness: true, format: {with: VALID_NUMBER_PLATE_REGEX}
  validates :password_digest, presence: true, length: {minimum: 8}


  has_secure_password

end
