class Schedule < ApplicationRecord
	has_many :football_field_schedules, dependent: :destroy
end
