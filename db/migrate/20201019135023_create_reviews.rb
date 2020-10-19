class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :comment, null: false
      t.integer :score_id, null: false
      t.references :user, null: false, foreign_key: true
      t.references :experience, null: false, foreign_key: true
      t.timestamps
    end
  end
end
