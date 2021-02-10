class GenreSerializer < ActiveModel::Serializer
  attributes :name

  attribute  :id, if: :show_experiences?
  attribute  :search, if: :show_experiences?

  belongs_to :category, unless: :search?

  # 属性取得判定用メソッド
  def show_experiences?
    @instance_options.key?(:show_experiences?)
  end

  # 属性取得判定用メソッド
  def search?
    @instance_options.key?(:search?)
  end
end
