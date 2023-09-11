class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :football_field, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :time_booking_start
      t.datetime :time_booking_end
      t.integer :status, limit: 1
      t.references :voucher, null: false, foreign_key: true
      t.decimal :total_price, precision: 15, scale: 4

      t.timestamps
    end
  end
end
