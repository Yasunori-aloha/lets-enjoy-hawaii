class ChangeDataLatitudeToExperiences < ActiveRecord::Migration[6.0]
  def change
    change_column :experiences, :latitude, :float, null: false
    change_column :experiences, :longitude, :float, null: false
    remove_column :experiences, :type_id, :integer, null: false
    add_column :genres, :type_id, :integer, null: false
  end
end
