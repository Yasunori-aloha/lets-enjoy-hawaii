class AddColumnHistories < ActiveRecord::Migration[6.0]
  def change
    add_column :histories, :comment, :string
  end
end
