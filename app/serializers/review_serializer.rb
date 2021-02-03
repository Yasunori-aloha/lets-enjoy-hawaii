class ReviewSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :comment,
             :score,
             :created_at

  # アクティビティの詳細ページでのみ取得する。
  belongs_to :user,       if: :is_experience_page?

  # ユーザー口コミ一覧ページでのみ取得する。
  belongs_to :experience, if: :current_user_page?

  def is_experience_page?
    @instance_options.key?(:is_experience_page)
  end

  def current_user_page?
    @instance_options.key?(:current_user_page?)
  end

end
