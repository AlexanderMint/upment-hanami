# frozen_string_literal: true

module Mutations
  module Auth
    SIGN_IN = GraphQL::Field.define do
      name 'SignIn'
      description 'User authorization'

      argument :email, !types.String
      argument :password, !types.String

      type Types::USER_TYPE

      resolve ->(_object, args, _ctx) do
        Api::Controllers::Auth::SignIn.new(args).call
      end
    end
  end
end
