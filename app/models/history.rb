# frozen_string_literal: true

class History < ApplicationRecord
  belongs_to :user
  belongs_to :experience

  # 同じユーザーが複数回同じアクティビティを保存しようとしていないか確認する。
  validates :user_id, uniqueness: { scope: :experience_id }
end
