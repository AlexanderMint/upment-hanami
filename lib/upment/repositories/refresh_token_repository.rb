# frozen_string_literal: true

class RefreshTokenRepository < Hanami::Repository
  associations do
    belongs_to :user
  end
end
