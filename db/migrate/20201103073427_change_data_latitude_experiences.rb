# frozen_string_literal: true

class ChangeDataLatitudeExperiences < ActiveRecord::Migration[6.0]
  def change
    change_column :experiences, :latitude, :double, null: false
    change_column :experiences, :longitude, :double, null: false
  end
end
