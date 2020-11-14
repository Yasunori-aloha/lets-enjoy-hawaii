class ReviewImage
  include ActiveModel::Model
  attr_accessor :score, :title, :comment, :images, :user_id, :experience_id

  with_options presence: true do
    validates :title
    validates :comment
    validates :score
  end

  def save
    Review.create(title: title, comment: comment, score: score, user_id: user_id, experience_id: experience_id)
    average_score = (Experience.find(experience_id).reviews.sum(:score).to_f / Experience.find(experience_id).reviews.length).round(1)
    Experience.find(experience_id).update(images: images, score: average_score)
  end
end