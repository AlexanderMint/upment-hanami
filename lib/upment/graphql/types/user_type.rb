# frozen_string_literal: true

require_relative 'date_time_type'
require_relative 'refresh_token_type'

module Types
  USER_TYPE ||= GraphQL::ObjectType.define do
    name 'User'
    description 'A User'

    field :id, !types.Int
    field :firstName, types.String, property: :first_name
    field :lastName, types.String, property: :last_name
    field :email, !types.String
    field :phone, types.Int
    field :createdAt, !DATE_TIME_TYPE, property: :created_at

    field :refreshTokens, types[REFRESH_TOKEN_TYPE] do
      resolve ->(obj, _args, _ctx) { RefreshTokenRepository.new.user_tokens(obj).call }
    end

    field :refreshToken, !types.String, property: :refresh_token
    field :accessToken, !types.String, property: :access_token
  end
end
