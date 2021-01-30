class ExperienceSerializer < ActiveModel::Serializer
  attributes :id, :name, :outline, :address, :latitude, :longitude, :business_hours_start, :business_hours_finish, :score, :heading, :pitch, :fov, :zoom, :image_url

  has_many :reviews
  belongs_to :area
  belongs_to :genre
  has_many :histories
  has_many :favorites
end
