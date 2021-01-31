class ExperienceSerializer < ActiveModel::Serializer
  attributes :id, :name, :outline, :address, :latitude, :longitude, :business_hours_start, :business_hours_finish, :score, :heading, :pitch, :fov, :zoom, :image_url, :favorite_counts

  # has_many :reviews
  belongs_to :area
  belongs_to :genre, if: :show_experiences?
  has_many :histories, if: :show_experiences?
  has_many :favorites, if: :show_experiences?

  def show_experiences?
    @instance_options.key?(:show_experiences)
  end

  def favorite_counts
    Experience.find(object.id).favorites.length
  end

end
