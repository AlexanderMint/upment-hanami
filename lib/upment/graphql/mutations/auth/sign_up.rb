# frozen_string_literal: true

module Mutations
  module Auth
    SIGN_UP ||= GraphQL::Field.define do
      name 'SignUp'
      description 'User registration'

      argument :email, !types.String
      argument :password, !types.String

      argument :firstName, types.String, as: :first_name
      argument :lastName, types.String, as: :last_name
      argument :phone, types.Int

      type Types::USER_TYPE

      resolve ->(_object, args, ctx) do
        Trailblazer::GraphQL.new(args, ctx).call(::Auth::SignUp)
      end
    end
  end
end
