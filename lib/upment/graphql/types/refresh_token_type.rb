# frozen_string_literal: true

require_relative 'date_time_type'

module Types
  REFRESH_TOKEN_TYPE ||= GraphQL::ObjectType.define do
    name 'RefreshToken'
    description 'A refresh token'

    field :id, !types.Int
    field :name, types.String
    field :token, !types.String
    field :createdAt, !DATE_TIME_TYPE, property: :created_at
  end
end
