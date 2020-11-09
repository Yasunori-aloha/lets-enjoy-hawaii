# frozen_string_literal: true

class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false, default: ''
    add_column :users, :introduce, :text
    add_column :users, :admin, :integer
  end
end
