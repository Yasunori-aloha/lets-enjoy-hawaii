class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  # 'user_id'が2回'experience_id'をお気に入りにいれていないかを確認する。
  validates :user_id, uniqueness: {scope: :experience_id}
end
