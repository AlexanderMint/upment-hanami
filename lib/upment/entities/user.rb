# frozen_string_literal: true

class User < Hanami::Entity
  attributes do
    attribute :id, Types::Int

    attribute :first_name, Types::String
    attribute :last_name, Types::String
    attribute :email, Types::String.constrained(format: /.+@.+\..+/i)
    attribute :phone, Types::String

    attribute :password, Types::String
    attribute :confirmation_token, Types::String
    attribute :reset_password_token, Types::String

    attribute :created_at, Types::Time
    attribute :updated_at, Types::Time
  end
end
