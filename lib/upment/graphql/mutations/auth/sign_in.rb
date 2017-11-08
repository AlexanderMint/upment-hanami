# frozen_string_literal: true

module Mutations
  module Auth
    SIGN_IN ||= GraphQL::Field.define do
      name 'SignIn'
      description 'User authorization'

      argument :email, !types.String
      argument :password, !types.String

      type Types::USER_TYPE

      resolve ->(_object, args, ctx) do
        Trailblazer::GraphQL.new(args, ctx).call(::Auth::SignIn)
      end
    end
  end
end
