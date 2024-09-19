class Service < ApplicationRecord
  # has_one_attached :image         #add once you have figures out the issues with adding image
  has_one_attached :image         # This line enables image attachment
  has_many :bookings
  validates :name, presence: true
  validates :description, presence: true
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end