# frozen_string_literal: true

class User < Hanami::Entity
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  attributes do
    attribute :id,         Types::Int
    attribute :first_name, Types::String
    attribute :last_name,  Types::String
    attribute :email,      Types::String.constrained(format: EMAIL_FORMAT)
    attribute :phone,      Types::String
    attribute :created_at, Types::Time
    attribute :updated_at, Types::Time
  end
end
