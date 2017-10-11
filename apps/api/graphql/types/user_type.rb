# frozen_string_literal: true

module Types
  UserType = GraphQL::ObjectType.define do
    name 'User'
    description 'A User'

    field :id, !types.ID
    field :firstName, types.String, property: :first_name
    field :lastName, types.String, property: :last_name
    field :email, !types.String
    field :phone, types.Int
    field :createdAt, DateTimeType, property: :created_at

    field :refreshToken, types.String, property: :refresh_token
    field :accessToken, types.String, property: :access_token
  end
end
