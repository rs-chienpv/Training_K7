class Favorite < ApplicationRecord
  belongs_to :football_field
  belongs_to :user
end
