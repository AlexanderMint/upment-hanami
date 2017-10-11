# frozen_string_literal: true

class NewUserChangeset < ROM::Changeset::Create[:users]
  map do |tuple|
    tuple.merge(
      email: tuple[:email]&.downcase,
      confirmation_token: random_token,
      password: bcrypt_password(tuple[:password])
    )
  end

  private

  def bcrypt_password(password)
    BCrypt::Password.create(password)
  end

  def random_token
    SecureRandom.uuid
  end
end
