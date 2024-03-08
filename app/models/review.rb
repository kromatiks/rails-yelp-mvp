class Review < ApplicationRecord
  # builds relationship to restaurnat
  belongs_to :restaurant

  # add validations
  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: [0, 1, 2, 3, 4, 5], message: "not a valid rating" }
end
