# frozen_string_literal: true

module Types
  UserType = GraphQL::ObjectType.define do
    name 'User'
    description 'A User'

    field :id, types.ID, 'The id of the User'
    field :firstName, types.String, 'The first_name of the User', property: :first_name
    field :lastName, types.String, 'The last_name of the User', property: :last_name
    field :email, types.String, 'The id email the User'
  end
end
