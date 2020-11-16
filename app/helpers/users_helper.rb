# frozen_string_literal: true

module UsersHelper
  def user_image_attached?(user)
    if user.image.attached?
      image_tag user.image, alt: 'no_image', height: '150px', width: '150px', id: 'user_image_set', class: 'user_image'
    else
      image_tag 'no_image.jpg', alt: 'no_image', height: '150px', width: '150px', id: 'user_image_set', class: 'user_image'
    end
  end
end
