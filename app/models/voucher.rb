class Voucher < ApplicationRecord
	has_many :bookings, dependent: :destroy
end
