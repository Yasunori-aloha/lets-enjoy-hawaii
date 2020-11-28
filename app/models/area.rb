# frozen_string_literal: true

class Area < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :island
  has_many :experiences

  with_options presence: true do
    validates :name, :island_id
  end
end
