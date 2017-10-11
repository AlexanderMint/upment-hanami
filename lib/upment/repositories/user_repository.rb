# frozen_string_literal: true

class UserRepository < Hanami::Repository
  associations do
    has_many :refresh_tokens
  end

  def add_refresh_token(user, token = random_token)
    assoc(:refresh_tokens, user).add(token: token)
  end

  def create_with_tokens(data)
    user_changeset = changeset(NewUserChangeset).data(data).map(:add_timestamps)

    transaction do
      user = create(user_changeset)
      token = add_refresh_token(user).token

      # Shit code
      User.new user.to_h.merge(refresh_token: token)
    end
  end

  # def find_with_refresh_token(token)
  #   aggregate(:refresh_tokens).where(token: token).as(User).one
  # end

  private

  def random_token
    SecureRandom.uuid
  end
end
