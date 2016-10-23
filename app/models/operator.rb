class Operator < ApplicationRecord
  VALID_NUMBER_PLATE_REGEX =  /[0-9]{1,3}[A-Z]{1,3}/

  validates :company_email, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
  validates :first_name, presence: true, length: {minimum: 2}, format: { with: /\A[a-zA-Z]+\z/, message: "your first name must only contain letters" }
  validates :last_name, presence: true, length: {minimum: 2}, format: { with: /\A[a-zA-Z]+\z/, message: "your last name must only contain letters" }
  validates :assigned_truck_rego, presence: true, length:{minimum: 6, maximum: 6}, uniqueness: true, format: {with: VALID_NUMBER_PLATE_REGEX}

  has_secure_password
end