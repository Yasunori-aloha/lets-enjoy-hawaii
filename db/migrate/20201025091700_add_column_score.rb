# frozen_string_literal: true

class AddColumnScore < ActiveRecord::Migration[6.0]
  def change
    add_column :experiences, :score, :float
  end
end
