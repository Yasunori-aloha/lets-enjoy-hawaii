class ReviewImage
  include ActiveModel::Model
  attr_accessor :score, :title, :comment, :images

  with_options presence: true do
    validates :title, length: { minimum: 50 }
    validates :comment
    validates :score
  end
end