class Deliver < ApplicationRecord
  validates :package_delivered, presence: true, format: { with: /\AYes\z/ }
end