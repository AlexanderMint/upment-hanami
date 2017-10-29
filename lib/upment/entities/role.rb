# frozen_string_literal: true

class Role < Hanami::Entity
  attributes do
    attribute :id, Types::Int
    attribute :user_id, Types::Int

    attribute :name, Types::Strict::String.enum('admin')

    attribute :created_at, Types::Time
    attribute :updated_at, Types::Time
  end
end
