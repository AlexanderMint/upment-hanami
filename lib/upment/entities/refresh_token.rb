# frozen_string_literal: true

class RefreshToken < Hanami::Entity
  attributes do
    attribute :id, Types::Int
    attribute :user_id, Types::Int

    attribute :name, Types::String
    attribute :token, Types::String

    attribute :created_at, Types::Time
    attribute :updated_at, Types::Time
  end
end
