class HistorySerializer < ActiveModel::Serializer
  attributes :id, :comment, :created_at

  belongs_to :experience
end
