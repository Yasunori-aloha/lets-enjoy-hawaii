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

  def image_url
    image.attached? ? url_for(image) : nil
  end

end
