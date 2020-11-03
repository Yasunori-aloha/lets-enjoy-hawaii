class ChangeTypeIdToGenres < ActiveRecord::Migration[6.0]
  def change
    rename_column :genres, :type_id, :category_id
  end
end
