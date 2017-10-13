# frozen_string_literal: true

module Resolvers::Auth::SignIn
  def self.build
    GraphQL::Field.define do
      argument :email, !types.String
      argument :password, !types.String

      type Types::UserType

      resolve ->(_object, args, _ctx) do
        Api::Controllers::Auth::SignIn.new(args).call
      end
    end
  end
end
