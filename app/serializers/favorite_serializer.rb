class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :comment, :created_at

  belongs_to :experience
end
