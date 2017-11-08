# frozen_string_literal: true

class RefreshToken
  class Policy < Trailblazer::Policy
    def destroy?
      true
    end
  end
end
