# frozen_string_literal: true

module Types
  QueryType = GraphQL::ObjectType.define do
    name 'Query'

    # /graphql?query={user(id: 1){ id, first_name, last_name }}
    field :user, Fetch::Field.build(model: UserRepository, type: UserType)

    # /graphql?query={users(limit: 5){ id, first_name, last_name }}
    field :users, Fetch::Collection.build(model: UserRepository, type: UserType)

    # /graphql?query={currentUser{ id, first_name, last_name }}
    field :currentUser, Fields::CurrentUser
  end
end
