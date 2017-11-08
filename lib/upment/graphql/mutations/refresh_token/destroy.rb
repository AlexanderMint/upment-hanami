# frozen_string_literal: true

module Mutations
  module RefreshToken
    DESTROY ||= GraphQL::Field.define do
      name 'DestroyRefreshToken'
      description 'Destroy refresh token'

      argument :id, !types.Int

      type types.Int

      resolve ->(_obj, args, ctx) do
        Trailblazer::GraphQL.new(args, ctx).call(::RefreshToken::Destroy)
      end
    end
  end
end
