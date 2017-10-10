# frozen_string_literal: true

require 'securerandom'
require 'digest/sha1'
require 'bcrypt'

class NewUserChangeset < ROM::Changeset::Create
  map do |tuple|
    tuple.merge(
      confirmation_token: generate_confirmation_token(tuple[:email]),
      password: bcrypt_password(tuple[:password])
    )
  end

  private

  def generate_confirmation_token(email)
    SecureRandom.hex(11) + Digest::SHA1.hexdigest(email)[0..9]
  end

  def bcrypt_password(password)
    BCrypt::Password.create(password)
  end
end
