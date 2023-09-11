class FootballField < ApplicationRecord
  belongs_to :type
	has_many :bookings, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :ratings, dependent: :destroy
	has_many :football_field_schedules, dependent: :destroy
	has_many :schedules, through: :football_field_schedules
end
