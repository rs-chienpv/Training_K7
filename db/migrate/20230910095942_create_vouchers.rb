class CreateVouchers < ActiveRecord::Migration[7.0]
  def change
    create_table :vouchers do |t|
      t.string :code
      t.integer :discount, limit: 1
      t.datetime :time_start
      t.datetime :time_end

      t.timestamps
    end
  end
end
