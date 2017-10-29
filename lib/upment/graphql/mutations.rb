# frozen_string_literal: true

module Mutations
  SCHEMA ||= GraphQL::ObjectType.define do
    name 'Mutation'

    field :signUp, Auth::SIGN_UP
    field :signIn, Auth::SIGN_IN

    field :updateUser, User::UPDATE
    field :destroyRefreshToken, RefreshToken::DESTROY
  end
end
