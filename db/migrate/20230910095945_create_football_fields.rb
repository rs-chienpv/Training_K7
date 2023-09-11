class CreateFootballFields < ActiveRecord::Migration[7.0]
  def change
    create_table :football_fields do |t|
      t.string :name
      t.string :address
      t.integer :capacity, limit: 1
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
