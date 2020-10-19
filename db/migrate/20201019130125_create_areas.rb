class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string  :name     , null: false, default: ""
      t.integer :island_id, null: false
      t.timestamps
    end
  end
end
