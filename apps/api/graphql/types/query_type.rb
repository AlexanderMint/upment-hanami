# frozen_string_literal: true

module Types
  QueryType = GraphQL::ObjectType.define do
    name 'Query'

    # http://up.com/graphql?query={user(id: 1){ id, first_name, last_name }}
    field :user, Fetch::Field.build(model: UserRepository, type: UserType)

    # http://up.com/graphql?query={users{ id, first_name, last_name }}
    field :users, Fetch::Collection.build(model: UserRepository, type: UserType)
  end
end
