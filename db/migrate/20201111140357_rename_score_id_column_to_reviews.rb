class RenameScoreIdColumnToReviews < ActiveRecord::Migration[6.0]
  def change
    rename_column :reviews, :score_id, :score
  end
end
