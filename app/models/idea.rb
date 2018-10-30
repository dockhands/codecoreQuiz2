class Idea < ApplicationRecord

    has_many :reviews, dependent: :destroy
    belongs_to :user, optional: true


   # has_many :likes, dependent: :destroy
    # The title column must be present and unique.
    # The body column must be present and contain at least 50 characters.

    validates :title, presence: {message: "must be provided"},
    uniqueness: { case_sensitive: true }

    validates :description, presence: {message: "must be provided"}, length: { minimum: 10 }

end
