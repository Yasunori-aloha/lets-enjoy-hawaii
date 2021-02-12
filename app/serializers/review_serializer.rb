class ReviewSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :comment,
             :score,
             :created_at

  # アクティビティの詳細ページでのみ取得する。
  attribute  :images_url, if: :show_experiences?
  belongs_to :user,       if: :show_experiences?

  # ユーザー口コミ一覧ページでのみ取得する。
  belongs_to :experience, if: :current_user_page?

  # 属性取得判定用メソッド
  def show_experiences?
    @instance_options.key?(:show_experiences?)
  end

  def current_user_page?
    @instance_options.key?(:current_user_page?)
  end

end
