class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :comment, :score

  belongs_to :user, if: :is_experience_page?
  belongs_to :experience, if: :is_user_page?

  def is_experience_page?
    @instance_options.key?(:is_experience_page)
  end

  def is_user_page?
    @instance_options.key?(:is_user_page)
  end

end
