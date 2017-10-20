# frozen_string_literal: true

module Fetch
  class Collection
    def self.build(model:, type:) # rubocop:disable Metrics/MethodLength
      return_type = type

      GraphQL::Field.define do
        type types[return_type]
        description "Get list of records from the table #{model.class.name}"

        argument :limit do
          type types.Int
          description 'How many records need to be received. Maximum 30'
          default_value 10
          prepare ->(limit, _ctx) { [limit, 30].min }
        end

        argument :order do
          type Types::Enum::OrderType
          description 'Sorting order'
          default_value 'asc'
        end

        resolve ->(_obj, args, _ctx) do
          model.new.users.limit(args[:limit]).order(Sequel.send(args[:order], :created_at)).call
        end
      end
    end
  end
end
