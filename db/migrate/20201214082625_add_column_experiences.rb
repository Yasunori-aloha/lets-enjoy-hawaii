class AddColumnExperiences < ActiveRecord::Migration[6.0]
  def change
    add_column :experiences, :heading, :float, null: false
    add_column :experiences, :pitch, :float, null: false
    add_column :experiences, :fov, :float, null: false
    add_column :experiences, :zoom, :float, null: false
  end
end
