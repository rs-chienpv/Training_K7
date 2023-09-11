# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'faker'
include Devise::Controllers::Helpers
# Tạo dữ liệu mẫu cho bảng "users"
10.times do
  password = Devise.friendly_token.first(8) # Tạo mật khẩu ngẫu nhiên độ dài 8 ký tự
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: rand(0..1),
    phone: Faker::PhoneNumber.phone_number,
    address: Faker::Address.full_address,
    role: rand(0..1)
  )
  user.password = password
  user.encrypted_password = Devise::Encryptor.digest(User, password) # Mã hóa mật khẩu
  user.save!
end

# Tạo dữ liệu mẫu cho bảng "types"
Type.create!(
  name: "Type 1",
  description: "Type 1 description"
)
Type.create!(
  name: "Type 2",
  description: "Type 2 description"
)
# Tạo dữ liệu mẫu cho bảng "football_fields"
10.times do
  FootballField.create!(
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    capacity: rand(1..10),
    type_id: rand(1..2)
  )
end

# Tạo dữ liệu mẫu cho bảng "schedules"
5.times do
  Schedule.create!(
    time_start: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    time_end: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1),
    price: Faker::Number.decimal(l_digits: 3, r_digits: 2)
  )
end

# Tạo dữ liệu mẫu cho bảng "vouchers"
5.times do
  Voucher.create!(
    code: Faker::Alphanumeric.alphanumeric(number: 6).upcase,
    discount: rand(10..50),
    time_start: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    time_end: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1)
  )
end

# Tạo dữ liệu mẫu cho bảng "bookings"
10.times do
  Booking.create!(
    football_field_id: rand(1..10),
    user_id: rand(1..10),
    time_booking_start: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    time_booking_end: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1),
    status: rand(0..1),
    voucher_id: rand(1..5),
    total_price: Faker::Number.decimal(l_digits: 10, r_digits: 4),
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )
end

# Tạo dữ liệu mẫu cho bảng "ratings"
10.times do
  Rating.create!(
    football_field_id: rand(1..10),
    user_id: rand(1..10),
    rating: rand(1..5),
    comment: Faker::Lorem.sentence,
    status: rand(0..1),
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )
end

# Tạo dữ liệu mẫu cho bảng "reply_ratings"
10.times do
  ReplyRating.create!(
    rating_id: rand(1..10),
    user_id: rand(1..10),
    comment: Faker::Lorem.sentence,
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )
end

# Tạo dữ liệu mẫu cho bảng "favorites"
10.times do
  Favorite.create!(
    football_field_id: rand(1..10),
    user_id: rand(1..10),
    created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )
end