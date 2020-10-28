class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  validates :name, presence: true

  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :histories, dependent: :destroy
  has_many :his_exps, through: :histories, source: :experience
  has_many :favorites, dependent: :destroy
  has_many :fav_exps, through: :favorites, source: :experience
  has_many :sns_credentials

  def self.from_omniauth(auth)
    binding.pry
  end
end
