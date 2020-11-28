# frozen_string_literal: true

class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true

  validates :uid, uniqueness: { scope: :provider, case_sensitive: false  }
end
