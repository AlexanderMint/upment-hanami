# frozen_string_literal: true

module Resolvers::Auth::SignUp
  def self.build
    GraphQL::Field.define do
      argument :firstName, !types.String, as: :first_name
      argument :lastName, !types.String, as: :last_name
      argument :email, !types.String
      argument :phone, types.Int

      type Types::UserType

      resolve ->(_object, args, _ctx) do
        Api::Controllers::Auth::SignUp.new(args).call
      end
    end
  end
end
