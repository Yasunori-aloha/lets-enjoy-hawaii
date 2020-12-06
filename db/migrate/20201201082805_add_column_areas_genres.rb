# frozen_string_literal: true

class AddColumnAreasGenres < ActiveRecord::Migration[6.0]
  def change
    add_column :areas, :search, :string

    add_column :genres, :search, :string
  end
end
