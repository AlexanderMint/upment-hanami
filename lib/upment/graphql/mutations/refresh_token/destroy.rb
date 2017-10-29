# frozen_string_literal: true

module Mutations
  module RefreshToken
    DESTROY ||= GraphQL::Field.define do
      name 'DestroyRefreshToken'
      description 'Destroy refresh token'

      argument :id, !types.Int

      type Types::REFRESH_TOKEN_TYPE

      resolve ->(_obj, args, ctx) do
        user = ctx[:current_user]
        repository = RefreshTokenRepository.new
        token = repository.find_by(id: args.id, user_id: user.id)

        if token || (user && RoleRepository.new.admin?(user.id))
          repository.delete(args.id)
        else
          GraphQL::ExecutionError.new('Forbidden')
        end
      end
    end
  end
end
