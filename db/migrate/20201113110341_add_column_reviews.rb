class AddColumnReviews < ActiveRecord::Migration[6.0]
  def up
    add_column :reviews, :title, :string
  end

  def change
    change_column :reviews, :comment, :text
  end
end