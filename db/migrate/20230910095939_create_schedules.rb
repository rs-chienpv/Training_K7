class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.time :time_start
      t.time :time_end
      t.decimal :price, precision: 15, scale: 4

      t.timestamps
    end
  end
end
