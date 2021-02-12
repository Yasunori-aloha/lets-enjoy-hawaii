class AreaSerializer < ActiveModel::Serializer
  attributes :name

  attribute  :id, if: :show_experiences?
  attribute  :search, if: :show_experiences?

  belongs_to :island

  # 属性取得判定用メソッド
  def show_experiences?
    @instance_options.key?(:show_experiences?)
  end
end
