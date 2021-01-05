# frozen_string_literal: true

class Experience < ApplicationRecord
  has_one_attached :image
  has_many :reviews
  belongs_to :area
  belongs_to :genre
  has_many :histories
  has_many :his_users, through: :histories, source: :user
  has_many :favorites
  has_many :fav_users, through: :favorites, source: :user

  delegate :name, :search, to: :area, prefix: true
  delegate :name, :search, to: :genre, prefix: true

  with_options presence: true do
    validates :name, :address, :latitude, :longitude
  end

  # インスタンス変数に対してメソッドを使用することで、1つのexperienceに対して'user_id'を探すことができる。
  def already_favorited?(user, exp)
    Favorite.exists?(user_id: user.id, experience_id: exp.id)
  end

  def already_histories?(user, exp)
    History.exists?(user_id: user.id, experience_id: exp.id)
  end
end
