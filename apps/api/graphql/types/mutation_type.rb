# frozen_string_literal: true

module Types
  MutationType = GraphQL::ObjectType.define do
    name 'Mutation'

    field :signUp, Resolvers::Auth::SignUp.build
    field :signIn, Resolvers::Auth::SignIn.build
  end
end
