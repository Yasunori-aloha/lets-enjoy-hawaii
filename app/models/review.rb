# frozen_string_literal: true

class Review < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :score
  belongs_to :user
  belongs_to :experience

  validates :score, presence: true
end
