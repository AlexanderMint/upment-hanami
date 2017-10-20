# frozen_string_literal: true

class RefreshTokenRepository < Hanami::Repository
  associations do
    belongs_to :user
  end

  def find_by(data)
    refresh_tokens.where(data).one
  end

  def find_with_user(data)
    user = aggregate(:user).where(data).map_to(RefreshToken).one
    User.new(refresh_token: data[:token], **user)
  end
end
