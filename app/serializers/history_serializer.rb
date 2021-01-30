class HistorySerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :user
  belongs_to :experience
end
