# frozen_string_literal: true

module Fields
  CurrentUser ||= GraphQL::Field.define do
    name 'CurrentUser'
    description 'Current user'

    type Types::UserType
    resolve ->(_object, _args, ctx) do
      ctx[:current_user]
    end
  end
end
