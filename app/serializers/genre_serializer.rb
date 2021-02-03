class GenreSerializer < ActiveModel::Serializer
  attributes :name

  belongs_to :category
end
