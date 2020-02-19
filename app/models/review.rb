class Review < ApplicationRecord
  RATINGS = (0..5).to_a
  belongs_to :restaurant
  validates :content, :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: RATINGS }
end
