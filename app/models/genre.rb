# frozen_string_literal: true

class Genre < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  has_many :experiences

  with_options presence: true do
    validates :name, :category_id
  end
end
