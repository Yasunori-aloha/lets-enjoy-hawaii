# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :experience

  # 'user'が2回'experience'をお気に入りにしていないかを確認する。
  validates_uniqueness_of :user, scope: :experience
end
