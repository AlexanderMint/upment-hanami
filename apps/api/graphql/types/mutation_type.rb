# frozen_string_literal: true

module Types
  MutationType = GraphQL::ObjectType.define do
    name 'Mutation'
    description 'Actions for adding, changing and deleting'

    # field :createUser, field: Mutations::CreateUserMutation.field
    # field :editUser, field: Mutations::EditUserMutation.field
    # field :deleteUser, field: Mutations::DeleteUserMutation.field
  end
end
