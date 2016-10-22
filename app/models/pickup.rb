class Driver < ApplicationRecord
  validates :charge, presence: true, numericality: true
  validates :collected, presence: true
  validates :signature, presence: true
end