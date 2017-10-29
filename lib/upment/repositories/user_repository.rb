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

  def add_refresh_token(user, data = {})
    data[:token] ||= random_token
    assoc(:refresh_tokens, user).add(data)
  end

  def create_with_tokens(user_data, token_data = {})
    user_changeset = changeset(NewUserChangeset).data(user_data).map(:add_timestamps)

    transaction do
      user = create(user_changeset)
      token = add_refresh_token(user, token_data).token

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
