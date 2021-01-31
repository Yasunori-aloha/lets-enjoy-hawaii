class ExperienceSerializer < ActiveModel::Serializer
  attributes :id, :name, :outline, :address, :latitude, :longitude, :business_hours_start, :business_hours_finish, :score, :heading, :pitch, :fov, :zoom, :image_url

  attribute :favorite_counts, unless: :user_histories_page?
  attribute :histories_counts, unless: :user_favorites_page?

  # has_many :reviews
  belongs_to :area
  belongs_to :genre, if: :show_experiences?
  has_many :histories, if: :show_experiences?
  has_many :favorites, if: :show_experiences?

  def show_experiences?
    @instance_options.key?(:show_experiences)
  end

  def user_favorites_page?
    @instance_options[:user_favorites_page?]
  end

  def favorite_counts
    object.favorites.length
  end

  def user_histories_page?
    @instance_options[:user_histories_page?]
  end

  def histories_counts
    object.histories.length
  end

end
