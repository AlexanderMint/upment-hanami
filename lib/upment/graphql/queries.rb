# frozen_string_literal: true

module Queries
  SCHEMA ||= GraphQL::ObjectType.define do
    name 'Query'

    field :user, function: Functions::FindRecord.new(resolve: ::User::Show,
                                                     type: Types::USER_TYPE)

    field :users, function: Functions::CollectionRecords.new(resolve: ::User::Index,
                                                             type: Types::USER_TYPE)

    field :currentUser, CURRENT_USER
  end
end
