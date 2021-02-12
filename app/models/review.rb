# frozen_string_literal: true

class Review < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_many_attached :images
  belongs_to :user
  belongs_to :experience

  delegate :name, to: :experience, prefix: true
  delegate :name, to: :user, prefix: true

  with_options presence: true do
    validates :title
    validates :comment
    validates :score
  end

  def images_url
    images.attached? ? images.map{|image| url_for(image)} : nil
  end

end
