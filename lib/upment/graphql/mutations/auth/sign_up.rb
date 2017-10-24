# frozen_string_literal: true

module Mutations
  module Auth
    SIGN_UP = GraphQL::Field.define do
      name 'SignUp'
      description 'User registration'

      argument :email, !types.String
      argument :password, !types.String

      argument :firstName, types.String, as: :first_name
      argument :lastName, types.String, as: :last_name
      argument :phone, types.Int

      type Types::USER_TYPE

      resolve ->(_object, args, _ctx) do
        Api::Controllers::Auth::SignUp.new(args).call
      end
    end
  end
end
