class IslandSerializer < ActiveModel::Serializer
  attributes :name

  attribute  :search, if: :show_experiences?

  # 属性取得判定用メソッド
  def show_experiences?
    @instance_options.key?(:show_experiences?)
  end

  # 属性取得用メソッド
  def name
    object[:name]
  end

  def search
    object[:search]
  end
end
