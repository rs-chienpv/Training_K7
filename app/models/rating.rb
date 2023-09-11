class Rating < ApplicationRecord
  belongs_to :football_field
  belongs_to :user
	has_many :reply_ratings, dependent: :destroy
end
