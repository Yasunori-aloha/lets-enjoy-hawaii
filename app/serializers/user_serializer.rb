class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :introduce, :admin, :image_url

  has_many :reviews, dependent: :destroy
  has_many :histories, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
