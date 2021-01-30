class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :comment, :score

  belongs_to :user
  belongs_to :experience
end
