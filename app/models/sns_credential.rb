# frozen_string_literal: true

class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true
end
