class ExperienceSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :latitude,
             :longitude,
             :heading,
             :pitch,
             :fov,
             :zoom

  attribute  :favorite_counts
  attribute  :reviews_counts
  belongs_to :area

  # アクティビティ詳細ページでのみ取得する。
  attribute  :outline,               if: :show_experiences?
  attribute  :address,               if: :show_experiences?
  attribute  :business_hours_start,  if: :show_experiences?
  attribute  :business_hours_finish, if: :show_experiences?
  attribute  :score_counts,          if: :show_experiences?
  attribute  :image_url,             if: :show_experiences?
  attribute  :images_counts,         if: :show_experiences?
  attribute  :already_favorited,     if: :show_experiences?
  attribute  :already_historied,     if: :show_experiences?
  has_many   :histories,             if: :show_experiences?
  has_many   :favorites,             if: :show_experiences?
  has_many   :reviews,               if: :show_experiences?

  # アクティビティ詳細ページと検索結果ページでのみ取得する。
  attribute  :score,                 if: :search_show_experiences?
  belongs_to :genre,                 if: :search_show_experiences?

  # アクティビティ詳細ページと検索結果ページでは取得しない。
  attribute  :histories_counts,  unless: :search_show_experiences?

  # 属性取得判定用メソッド
  def show_experiences?
    @instance_options.key?(:show_experiences?)
  end

  def search_show_experiences?
    @instance_options.key?(:search_show_experiences?)
  end

  # 属性取得用メソッド
  def favorite_counts
    object.favorites.length
  end

  def reviews_counts
    object.reviews.length
  end

  def histories_counts
    object.histories.length
  end

  def score_counts
    object.reviews.group(:score).count
  end

  def images_counts
    images_counts = 0
    if object.reviews
      object.reviews.each{ |review| images_counts += review.images.length }
    end
    images_counts
  end

  def already_favorited
    user_id = @instance_options[:current_user_id]
    Favorite.exists?(user_id: user_id, experience_id: object.id)
  end

  def already_historied
    user_id = @instance_options[:current_user_id]
    History.exists?(user_id: user_id, experience_id: object.id)
  end

  def reviews
    object.reviews.order('created_at DESC')
  end
end
