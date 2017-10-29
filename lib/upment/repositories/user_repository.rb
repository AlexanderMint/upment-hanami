# frozen_string_literal: true

class UserRepository < Hanami::Repository
  associations do
    has_many :refresh_tokens
    has_many :roles
  end

  def find_by(data)
    users.where(data).one
  end

  ### Tokens

  def add_refresh_token(user, token = random_token)
    assoc(:refresh_tokens, user).add(token: token)
  end

  def create_with_tokens(data)
    user_changeset = changeset(NewUserChangeset).data(data).map(:add_timestamps)

    transaction do
      user = create(user_changeset)
      token = add_refresh_token(user).token

      User.new(refresh_token: token, **user)
    end
  end

  ### Roles

  def add_role(user, name)
    assoc(:roles, user).add(name: name)
  end

  private

  def random_token
    SecureRandom.uuid
  end
end
