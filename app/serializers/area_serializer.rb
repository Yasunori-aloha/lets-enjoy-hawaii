class AreaSerializer < ActiveModel::Serializer
  attributes :name

  belongs_to :island
end
