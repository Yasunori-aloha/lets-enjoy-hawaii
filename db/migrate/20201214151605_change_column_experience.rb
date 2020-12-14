class ChangeColumnExperience < ActiveRecord::Migration[6.0]
  def change
    change_column :experiences, :heading, :double
    change_column :experiences, :pitch, :double
    change_column :experiences, :fov, :double
    change_column :experiences, :zoom, :double
  end
end
