class IslandSerializer < ActiveModel::Serializer
  attributes :name

  attribute  :id, if: :show_experiences?
  attribute  :search, if: :show_experiences?

  # 属性取得判定用メソッド
  def show_experiences?
    @instance_options.key?(:show_experiences?)
  end

  # 属性取得用メソッド
  def id
    object[:id]
  end

  def name
    object[:name]
  end

  def search
    object[:search]
  end
end
