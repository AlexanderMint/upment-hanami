# frozen_string_literal: true

class Auth
  class Policy < Trailblazer::Policy
    def sign_in?
      true
    end

    def sign_up?
      true
    end
  end
end
