class GenreSerializer < ActiveModel::Serializer
  attributes :name

  belongs_to :category, unless: :search_show_experiences?

  # 属性取得判定用メソッド
  def search_show_experiences?
    @instance_options.key?(:search_show_experiences?)
  end
end
