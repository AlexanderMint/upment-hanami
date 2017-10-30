# frozen_string_literal: true

require_relative 'date_time_type'

module Types
  REFRESH_TOKEN_TYPE ||= GraphQL::ObjectType.define do
    name 'RefreshToken'
    description 'A refresh token'

    field :id, !types.Int
    field :browserName, types.String, property: :browser_name
    field :deviceName, types.String, property: :device_name
    field :osName, types.String, property: :os_name
    field :token, !types.String
    field :userAgent, types.String, property: :user_agent
    field :createdAt, !DATE_TIME_TYPE, property: :created_at
  end
end
