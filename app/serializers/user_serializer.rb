class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :introduce, :admin

  has_many :reviews, dependent: :destroy
  has_many :histories, dependent: :destroy
  has_many :his_exps, through: :histories, source: :experience
  has_many :favorites, dependent: :destroy
  has_many :fav_exps, through: :favorites, source: :experience
  has_many :sns_credentials
end
