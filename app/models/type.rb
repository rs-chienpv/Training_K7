class Type < ApplicationRecord
	has_many :football_fields, dependent: :destroy
end
