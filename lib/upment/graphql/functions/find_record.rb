# frozen_string_literal: true

module Functions
  class FindRecord < GraphQL::Function
    attr_reader :type

    def initialize(resolve:, type:)
      @resolve = resolve
      @type = type
    end

    argument :id, GraphQL::ID_TYPE

    def call(_obj, args, ctx)
      Trailblazer::GraphQL.new(args, ctx).call(@resolve)
    end
  end
end
