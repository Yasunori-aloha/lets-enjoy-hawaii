class Experience < ApplicationRecord
  has_one_attached :image
  has_many :reviews
  belongs_to :area
  belongs_to :genre
  has_many :histories
  has_many :his_users, through: :histories, source: :user
  has_many :favorites
  has_many :fav_users, through: :favorites, source: :user

  def self.search(search)
    return Experience.all unless search
    Experience.where('name LIKE ?', "%#{search}%")
  end
end
