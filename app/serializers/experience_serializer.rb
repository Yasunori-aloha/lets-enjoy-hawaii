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
  attribute  :histories_counts

  belongs_to :area

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

  # 属性取得判定用メソッド
  def show_experiences?
    @instance_options.key?(:show_experiences)
  end

  # 属性取得用メソッド
  def favorite_counts
    object.favorites.length
  end

  def histories_counts
    object.histories.length
  end

end
