class GenreSerializer < ActiveModel::Serializer
  attributes :name

  belongs_to :category, unless: :search?

  # 属性取得判定用メソッド
  def search?
    @instance_options.key?(:search?)
  end
end
