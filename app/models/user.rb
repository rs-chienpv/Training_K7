class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
	has_many :favorites, dependent: :destroy
	has_many :football_fields, through: :favorite
	has_many :ratings, dependent: :destroy
	has_many :reply_ratings, dependent: :destroy
	has_many :bookings, dependent: :destroy
end
