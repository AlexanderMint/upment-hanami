# frozen_string_literal: true

require_relative '../types/enum/order_type'

module Functions
  class CollectionRecords < GraphQL::Function
    attr_reader :type

    def initialize(resolve:, type:)
      @resolve = resolve
      @type = self.class.types[!type]
    end

    argument :limit do
      type types.Int
      description 'How many records need to be received. Maximum 30'
      default_value 10
      prepare ->(limit, _ctx) { [limit, 30].min }
    end

    argument :order do
      type Types::Enum::ORDER_TYPE
      description 'Sorting order'
      default_value 'asc'
    end

    def call(_obj, args, ctx)
      Trailblazer::GraphQL.new(args, ctx).call(@resolve)
    end
  end
end
