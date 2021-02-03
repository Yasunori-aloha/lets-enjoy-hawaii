class IslandSerializer < ActiveModel::Serializer
  attributes :name

  # 属性取得用メソッド
  def name
    object[:name]
  end
end
