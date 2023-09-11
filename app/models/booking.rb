class Booking < ApplicationRecord
  belongs_to :football_field
  belongs_to :user
  belongs_to :voucher
end
