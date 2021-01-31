class HistorySerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :experience
end
