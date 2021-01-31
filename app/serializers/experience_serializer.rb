class ExperienceSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :latitude,
             :longitude,
             :heading,
             :pitch,
             :fov,
             :zoom

  belongs_to :area

  # お気に入り一覧ページでのみ取得する。
  attribute  :favorite_counts,        unless: :user_histories_page?

  # 訪問記録一覧ページでのみ取得する。
  attribute  :histories_counts,       unless: :user_favorites_page?

  # アクティビティ詳細ページでのみ取得する。
  attribute  :outline,                if: :show_experiences?
  attribute  :address,                if: :show_experiences?
  attribute  :business_hours_start,   if: :show_experiences?
  attribute  :business_hours_finish,  if: :show_experiences?
  attribute  :score,                  if: :show_experiences?
  attribute  :image_url,              if: :show_experiences?
  belongs_to :genre,                  if: :show_experiences?
  has_many   :histories,              if: :show_experiences?
  has_many   :favorites,              if: :show_experiences?

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
