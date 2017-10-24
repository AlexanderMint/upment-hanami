# frozen_string_literal: true

require_relative '../types/enum/order_type'

module Functions
  class CollectionRecords < GraphQL::Function
    attr_reader :type

    def initialize(model:, type:)
      @model = model
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

    def call(_obj, args, _ctx)
      repository.root.limit(args[:limit]).order(Sequel.send(args[:order], :created_at)).call.collection
    end

    private

    def repository
      @repository ||= @model.new
    end

    def type_class
      "Types::#{type}Type".constantize
    end
  end
end
