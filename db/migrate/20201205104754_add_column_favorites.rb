# frozen_string_literal: true

class AddColumnFavorites < ActiveRecord::Migration[6.0]
  def change
    add_column :favorites, :comment, :string
  end
end
