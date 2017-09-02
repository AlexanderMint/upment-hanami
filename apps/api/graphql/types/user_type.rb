# frozen_string_literal: true

module Types
  UserType = GraphQL::ObjectType.define do
    name 'User'
    description 'A User'

    field :id, types.ID, 'The id of the User'
    field :first_name, types.String, 'The first_name of the User'
    field :last_name, types.String, 'The last_name of the User'
    field :email, types.String, 'The id email the User'
  end
end
