class ChangeColumnExperiences < ActiveRecord::Migration[6.0]
  def change
    change_column :experiences, :heading, :double, null: false
    change_column :experiences, :pitch, :double, null: false
    change_column :experiences, :fov, :double, null: false
    change_column :experiences, :zoom, :double, null: false
  end
end
