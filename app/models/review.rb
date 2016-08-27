class Review < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  validates_presence_of :comment
 end
