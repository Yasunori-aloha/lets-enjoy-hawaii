# frozen_string_literal: true

module WaitForLoaded
  def wait_for_selector(selector)
    until has_selector?(selector); end
  end
end
