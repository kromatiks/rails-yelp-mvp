class Restaurant < ApplicationRecord
  # build many-to-one relationship
  # dependent destroy, means if a restaurant is destroyed
  # all the associated reviews are destroyed
  has_many :reviews, dependent: :destroy

  # add validations
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"], message: "not a valid category" }
end
