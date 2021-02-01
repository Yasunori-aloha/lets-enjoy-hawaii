class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :introduce, :admin, :image_url

  has_many :reviews
  has_many :histories
  has_many :favorites
end
