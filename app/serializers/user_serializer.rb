class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :name,
             :introduce,
             :admin,
             :image_url

  # ユーザーページ遷移時のみ取得する。
  attribute  :favorites_counts, if: :current_user_page?
  attribute  :reviews_counts,   if: :current_user_page?
  attribute  :histories_counts, if: :current_user_page?

  # ログイン処理時はデータを取得しない。
  has_many   :reviews,      unless: :login_or_signup?
  has_many   :histories,    unless: :login_or_signup?
  has_many   :favorites,    unless: :login_or_signup?

  # 属性取得判定用メソッド
  def current_user_page?
    @instance_options.key?(:current_user_page?)
  end

  def login_or_signup?
    @instance_options.key?(:login_or_signup?)
  end

  # 属性取得用メソッド
  def favorites_counts
    object.favorites.length
  end

  def reviews_counts
    object.reviews.length
  end

  def histories_counts
    object.histories.length
  end

end
