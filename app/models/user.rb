# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :omniauthable,
         omniauth_providers: %i[facebook google_oauth2]

  include DeviseTokenAuth::Concerns::User

  with_options presence: true do
    validates :name
    # '@'がメールアドレスに入っていること。
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: true }
    # ユーザー新規登録時のみバリデーションを適用する。
    with_options on: :create do
      # 半角英数字記号含め8文字以上で、記号を2回以上使用すること。
      validates :password, format: { with: /\A(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!-\/:-@\[-`\{-~].*[!-\/:-@\[-`\{-~])([a-zA-Z0-9!-\/:-@\[-`\{-~]{8,})\z/ }, confirmation: true
      validates :password_confirmation
    end
  end

  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :histories, dependent: :destroy
  has_many :his_exps, through: :histories, source: :experience
  has_many :favorites, dependent: :destroy
  has_many :fav_exps, through: :favorites, source: :experience
  has_many :sns_credentials

  def self.from_omniauth(auth)
    # SnsCredentialモデル内を検索して、アカウントがなければアカウント情報をテーブルに保存する。
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # SNSのアカウント情報がなければ、emailからUserモデル内を検索して取得する、もしくは新たにインスタンスを生成する。
    user =
      User.where(email: auth.info.email).first_or_initialize(
        email: auth.info.email, name: auth.info.name
      )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  def self.guest
    find_or_create_by!(email: 'guest@sample.com') do |user|
      user.name = 'ゲストユーザー'
      user.introduce = 'ゲストユーザーです。'
      user.password = "#{SecureRandom.urlsafe_base64(7)}!!"
      user.password_confirmation = user.password
      user.uid = user.email
      user.provider = 'email'
    end
  end
end
