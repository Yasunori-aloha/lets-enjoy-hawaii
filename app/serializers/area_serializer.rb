class AreaSerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :island
end
