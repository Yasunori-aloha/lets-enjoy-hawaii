module Overrides
  class Api::Auth::SessionsController < DeviseTokenAuth::SessionsController

    def new_guest
    end

  end
end
