# frozen_string_literal: true

require_relative '../types/user_type'

module Queries
  CURRENT_USER ||= GraphQL::Field.define do
    name 'CurrentUser'
    description 'Current user'

    type Types::USER_TYPE
    resolve ->(_obj, _args, ctx) do
      ctx[:current_user]
    end
  end
end
