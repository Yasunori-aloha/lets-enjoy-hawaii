class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :image_url

  attribute  :email,        unless: :show_experiences?
  attribute  :introduce,    unless: :show_experiences?
  attribute  :admin,        unless: :show_experiences?

  # ユーザーページ遷移時のみ取得する。
  attribute  :favorites_counts, if: :current_user_page?
  attribute  :reviews_counts,   if: :current_user_page?
  attribute  :histories_counts, if: :current_user_page?

  # ログイン処理時はデータを取得しない。
  has_many   :reviews,      unless: :login_or_signup_or_experience?
  has_many   :histories,    unless: :login_or_signup_or_experience?
  has_many   :favorites,    unless: :login_or_signup_or_experience?

  # 属性取得判定用メソッド
  def show_experiences?
    @instance_options.key?(:show_experiences?)
  end

  def current_user_page?
    @instance_options.key?(:current_user_page?)
  end

  def login_or_signup_or_experience?
    @instance_options.key?(:login_or_signup_or_experience?)
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
