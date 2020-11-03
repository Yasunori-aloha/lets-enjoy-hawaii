class Experience < ApplicationRecord
  has_one_attached :image
  has_many :reviews
  belongs_to :area
  belongs_to :genre
  has_many :histories
  has_many :his_users, through: :histories, source: :user
  has_many :favorites
  has_many :fav_users, through: :favorites, source: :user

  # インスタンス変数に対してメソッドを使用することで、1つのexperienceに対して'user_id'を探すことができる。
  def already_favorited?(user)
    Favorite.find_by(user_id: user.id).exists?
  end
end
