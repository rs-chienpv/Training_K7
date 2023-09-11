class CreateFootballFieldSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :football_field_schedules do |t|
      t.references :football_field, null: false, foreign_key: true
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
