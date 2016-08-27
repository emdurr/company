class Review < ApplicationRecord
  belongs_to :pet
  validates :comment, presence: true
end
