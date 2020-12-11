# frozen_string_literal: true

module WaitForLoaded
  def wait_for_loaded_until_content_exists(selector)
    until has_selector?(selector); end
  end
end
