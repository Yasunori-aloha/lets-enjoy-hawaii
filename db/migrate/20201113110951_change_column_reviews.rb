# frozen_string_literal: true

class ChangeColumnReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :title, :string, null: false
  end
end
