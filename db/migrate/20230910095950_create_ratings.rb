class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.references :football_field, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :rating, limit: 1
      t.string :comment
      t.integer :status, limit: 1

      t.timestamps
    end
  end
end
