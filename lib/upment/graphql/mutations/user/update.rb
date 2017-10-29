# frozen_string_literal: true

module Mutations
  module User
    UPDATE ||= GraphQL::Field.define do
      name 'UpdateUser'
      description 'User update'

      argument :id, !types.Int
      argument :firstName, types.String, as: :first_name
      argument :lastName, types.String, as: :last_name

      type Types::USER_TYPE

      resolve ->(_obj, args, ctx) do
        user = ctx[:current_user]

        if args.id == user.id || (user && RoleRepository.new.admin?(user.id))
          Api::Controllers::Users::Update.new(args).call
        else
          GraphQL::ExecutionError.new('Forbidden')
        end
      end
    end
  end
end
