class CreateReplyRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :reply_ratings do |t|
      t.references :rating, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
