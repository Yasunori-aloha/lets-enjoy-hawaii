class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :introduce, :admin, :image_url

  # ログイン処理時はデータを取得しない。
  has_many :reviews, unless: :login_or_signup?
  has_many :histories, unless: :login_or_signup?
  has_many :favorites, unless: :login_or_signup?

  def login_or_signup?
    @instance_options.key?(:login_or_signup?)
  end

end
