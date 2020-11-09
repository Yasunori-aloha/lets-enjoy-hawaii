# frozen_string_literal: true

class History < ApplicationRecord
  belongs_to :user
  belongs_to :experience
end
