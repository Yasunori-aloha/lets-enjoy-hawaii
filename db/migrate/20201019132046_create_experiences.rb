class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string     :name, null: false, default: ''
      t.text       :outline
      t.string     :address, null: false
      t.integer    :latitude, null: false
      t.integer    :longitude, null: false
      t.integer    :type_id, null: false
      t.string     :business_hours_start
      t.string     :business_hours_finish
      t.references :area, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.timestamps
    end
  end
end
