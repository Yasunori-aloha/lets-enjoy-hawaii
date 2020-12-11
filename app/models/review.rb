# frozen_string_literal: true

class Review < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  belongs_to :experience

  delegate :name, to: :experience, prefix: true
  delegate :name, to: :user, prefix: true

  with_options presence: true do
    validates :title
    validates :comment
    validates :score
  end
end
