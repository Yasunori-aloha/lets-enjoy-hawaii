class Area < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :island
  has_many :experiences

  validates :island, presence: true
end
