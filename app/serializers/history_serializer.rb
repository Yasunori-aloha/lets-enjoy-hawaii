class HistorySerializer < ActiveModel::Serializer
  attributes :id

  # ユーザーページに遷移時のみ取得する。
  attribute  :comment,    if: :current_user_page?
  attribute  :created_at, if: :current_user_page?
  belongs_to :experience, if: :current_user_page?

  # 属性取得判定用メソッド
  def current_user_page?
    @instance_options.key?(:current_user_page?)
  end

end
