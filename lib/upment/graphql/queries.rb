# frozen_string_literal: true

require_relative '../repositories/user_repository'

module Queries
  SCHEMA = GraphQL::ObjectType.define do
    name 'Query'

    field :user, function: Functions::FindRecord.new(model: UserRepository, type: Types::USER_TYPE)
    field :users, function: Functions::CollectionRecords.new(model: UserRepository, type: Types::USER_TYPE)

    field :currentUser, CURRENT_USER
  end
end
