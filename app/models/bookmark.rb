class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie_id, uniqueness: { scope: :list_id, message: "Existed!" }
  validates :comment, presence: true, length: { minimum: 6, message: "More than 6 CHAR" }
end
