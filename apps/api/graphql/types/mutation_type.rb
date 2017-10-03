# frozen_string_literal: true

module Types
  MutationType = GraphQL::ObjectType.define do
    name 'Mutation'

    field :signUp, Resolvers::Auth::SignUp.build
  end
end
