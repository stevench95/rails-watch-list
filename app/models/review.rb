class Review < ApplicationRecord
  belongs_to :list

  validates :body, presence: true
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }, allow_nil: true
end
