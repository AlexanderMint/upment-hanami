# frozen_string_literal: true

module Mutations
  module RefreshToken
    DESTROY ||= GraphQL::Field.define do
      name 'DestroyRefreshToken'
      description 'Destroy refresh token'

      argument :id, !types.Int

      type Types::REFRESH_TOKEN_TYPE

      resolve ->(_obj, args, _ctx) do
        RefreshTokenRepository.new.delete(args.id)
      end
    end
  end
end
