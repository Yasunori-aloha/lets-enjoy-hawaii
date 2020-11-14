class ReviewImage
  include ActiveModel::Model
  attr_accessor :score, :title, :comment, :images

  with_options presence: true do
    validates :title
    validates :comment
    validates :score
  end

  def save
    Review.create(title: title, comment: comment, score: score, user_id: current_user.id, experience_id: experience_id)
    Experience.update!()
  end
end