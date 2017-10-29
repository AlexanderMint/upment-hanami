# frozen_string_literal: true

module Mutations
  module User
    UPDATE ||= GraphQL::Field.define do
      name 'UpdateUser'
      description 'User update'

      argument :id, !types.Int
      argument :firstName, types.String, as: :first_name
      argument :lastName, types.String, as: :last_name

      type Types::USER_TYPE

      resolve ->(_obj, args, ctx) do
        # Temporarily. There are no roles yet
        data = args.to_h.merge 'id' => ctx[:current_user].id
        Api::Controllers::Users::Update.new(data).call
      end
    end
  end
end
